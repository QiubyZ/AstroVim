return {
  {
    "hsanson/vim-android",
    ft = { "kotlin", "java", "xml", "gradle" },
    config = function()
      -- Konfigurasi path Android SDK untuk Termux
      vim.g.android_sdk_path = "/data/data/com.termux/files/home/android-sdk"

      -- Path Gradle (gunakan Gradle wrapper yang biasanya ada di proyek Android)
      vim.g.gradle_use_wrapper = 1

      -- Path ke ADB tool
      vim.g.android_adb_tool = "/data/data/com.termux/files/home/android-sdk/platform-tools/adb"

      -- Konfigurasi CLASSPATH
      vim.g.android_classpath = {
        "/data/data/com.termux/files/home/android-sdk/platforms/android-34/android.jar",
        -- Tambahkan path lain sesuai kebutuhan proyek Anda
      }

      -- Konfigurasi SRCPATH
      vim.g.android_srcpath = {
        "/data/data/com.termux/files/home/android-sdk/platforms/android-34",
        -- Tambahkan path sumber proyek Anda di sini
      }

      -- Fungsi untuk menambahkan path ke CLASSPATH
      vim.g.android_add_to_classpath = function(path)
        local classpath = vim.g.android_classpath or {}
        table.insert(classpath, path)
        vim.g.android_classpath = classpath
      end

      -- Fungsi untuk menambahkan path ke SRCPATH
      vim.g.android_add_to_srcpath = function(path)
        local srcpath = vim.g.android_srcpath or {}
        table.insert(srcpath, path)
        vim.g.android_srcpath = srcpath
      end

      -- Konfigurasi tambahan
      vim.g.android_lint_enabled = 1
    end,
  },
}