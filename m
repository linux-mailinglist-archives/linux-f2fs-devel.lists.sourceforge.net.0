Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B448B20BF31
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jun 2020 09:04:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jp4sm-0006LI-Fb; Sat, 27 Jun 2020 07:04:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <drinkcat@chromium.org>) id 1jp4sk-0006LA-Ri
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Jun 2020 07:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XGdLcrAvmkPIKoBWNvP5dEwpw2VzB6ZsodUaJtAc268=; b=YJLQ6s1oUdcTe2fbK7mjVamuK8
 Dr7lrXPra/Hq0hZPIKq6JtX8KO9dUSClpWkhPPF0kD7tBdg15b+W4CLBwg8t8mx+u9OqrAemJ4eOz
 2/oGbGRbf63maKhM3Ty3IiX/Y9tpVJxOpBNKRD7FBzNX2033ZK2Hh8L/OMkyfGjD4uzQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XGdLcrAvmkPIKoBWNvP5dEwpw2VzB6ZsodUaJtAc268=; b=lFt/qhDtH9JGpR8eHp7m9OH+Fm
 4vTlgeUoLBMjMfVo4kuGJt9AepgsNQTm9tushMAdfaaangTiNZui3K3KIUqQHEgBmxMWKbnxyJRU1
 dAtqf+HLci81Z975Ave9ws20etQiJwzekI/CiP14ZZpKEPYbtt+L047ETkzPqRhpl1H8=;
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jp4sj-002rqg-Gv
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Jun 2020 07:04:10 +0000
Received: by mail-pl1-f196.google.com with SMTP id d10so5123871pls.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 27 Jun 2020 00:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XGdLcrAvmkPIKoBWNvP5dEwpw2VzB6ZsodUaJtAc268=;
 b=Zn9TKw226u2aXcveeQJo/6qpreREm/sGylWxm517psg7XF3rhiVwVoOx4GGf81IF6K
 02bnu6Ug6Yef/NSdnI0j7TiUy+4P2Y9azEev4dgE90ePiTN4KDha4DcvvRKkyj4CCKWF
 eA4pcyWPPy3mJD+efzBV99Tr0VTZbPa5N6tbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XGdLcrAvmkPIKoBWNvP5dEwpw2VzB6ZsodUaJtAc268=;
 b=Xz/UEsnW6wbXnDp+rQh91oEUq+fHa53wvogO8nEVhlgxx7DkIbolM3ZF1gUqyOT76J
 U52D4/E6ez0Kxql8iB/Iqm0J59LifV/JXVOZn21r+uvMwlkG6vN34v1ihZL3sWyztb/k
 plLYFF/Q2V21rtxGOUhoWPdtdSxyBDEToLUdWWE22vAYBsnvbjdAk7DaqgIAtMToP/MW
 Lwp5AWHqoJvkpuskM7aQNUHcQwXShOuyWNMFbUOR6UzXb5K/Ip8Hzbnx4nrEou5vvwiY
 auTFV+5MHDq2xKBXsbY+QjSI3T7Uxj9eJERfQpO0IFDtC9M+yuv87khvz8WI6qL20xVO
 jLKA==
X-Gm-Message-State: AOAM5305GJ7qDW4KSjYC4CJa4u2JyN45oG9krDZJq1qGWefna72hwnLV
 9uVp9a3kwGWTGXGRLGdzFVjW2A==
X-Google-Smtp-Source: ABdhPJyrPO8mMivZ9WdRk9xUe9m8FFceT04ent9x0NWwUKTZQRxEsVK15EeSeQRHuWdJSKitwza3qg==
X-Received: by 2002:a17:902:fe90:: with SMTP id
 x16mr4430374plm.307.1593241436775; 
 Sat, 27 Jun 2020 00:03:56 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id u4sm28133269pfl.102.2020.06.27.00.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2020 00:03:55 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Sat, 27 Jun 2020 15:03:07 +0800
Message-Id: <20200627070307.516803-5-drinkcat@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200627070307.516803-1-drinkcat@chromium.org>
References: <20200627070307.516803-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.196 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jp4sj-002rqg-Gv
Subject: [f2fs-dev] [PATCH v2 4/4] kernel/trace: Add TRACING_ALLOW_PRINTK
 config option
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: Peter Chen <peter.chen@nxp.com>,
 "Guilherme G . Piccoli" <gpiccoli@canonical.com>,
 Rafael Aquini <aquini@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Howells <dhowells@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Will Deacon <will@kernel.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Kees Cook <keescook@chromium.org>, devel@driverdev.osuosl.org,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Nicolas Boichat <drinkcat@chromium.org>, Jayshri Pawar <jpawar@cadence.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andy Gross <agross@kernel.org>,
 Tomas Winkler <tomas.winkler@intel.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-media@vger.kernel.org, Pawel Laszczak <pawell@cadence.com>,
 Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Divya Indi <divya.indi@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

trace_printk is meant as a debugging tool, and should not be
compiled into production code without specific debug Kconfig
options enabled, or source code changes, as indicated by the
warning that shows up on boot if any trace_printk is called:
 **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
 **                                                      **
 ** trace_printk() being used. Allocating extra memory.  **
 **                                                      **
 ** This means that this is a DEBUG kernel and it is     **
 ** unsafe for production use.                           **

If this option is set to n, the kernel will generate a
build-time error if trace_printk is used.

Note that the code to handle trace_printk is still present,
so this does not prevent people from compiling out-of-tree
kernel modules with the option set to =y, or BPF programs.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---

Changes since v1:
 - Use static_assert instead of __static_assert (Jason Gunthorpe)
 - Fix issues that can be detected by this patch (running some
   randconfig in a loop, kernel test robot, or manual inspection),
   by:
   - Making some debug config options that use trace_printk depend
     on the new config option.
   - Adding 3 patches before this one.

There is a question from Alexei whether the warning is warranted,
and it's possibly too strongly worded, but the fact is, we do
not want trace_printk to be sprinkled in kernel code by default,
unless a very specific Kconfig command is enabled (or preprocessor
macro).

There's at least 3 reasons that I can come up with:
 1. trace_printk introduces some overhead.
 2. If the kernel keeps adding always-enabled trace_printk, it will
    be much harder for developers to make use of trace_printk for
    debugging.
 3. People may assume that trace_printk is for debugging only, and
    may accidentally output sensitive data (theoritical at this
    stage).

 drivers/gpu/drm/i915/Kconfig.debug |  4 ++--
 fs/f2fs/Kconfig                    |  1 +
 include/linux/kernel.h             | 17 ++++++++++++++++-
 kernel/trace/Kconfig               | 10 ++++++++++
 samples/Kconfig                    |  2 ++
 5 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index 1cb28c20807c59d..fa30f9bdc82311f 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -84,7 +84,7 @@ config DRM_I915_ERRLOG_GEM
 config DRM_I915_TRACE_GEM
 	bool "Insert extra ftrace output from the GEM internals"
 	depends on DRM_I915_DEBUG_GEM
-	select TRACING
+	depends on TRACING_ALLOW_PRINTK
 	default n
 	help
 	  Enable additional and verbose debugging output that will spam
@@ -98,7 +98,7 @@ config DRM_I915_TRACE_GEM
 config DRM_I915_TRACE_GTT
 	bool "Insert extra ftrace output from the GTT internals"
 	depends on DRM_I915_DEBUG_GEM
-	select TRACING
+	depends on TRACING_ALLOW_PRINTK
 	default n
 	help
 	  Enable additional and verbose debugging output that will spam
diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index d13c5c6a978769b..d161d96cc1b7418 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -80,6 +80,7 @@ config F2FS_IO_TRACE
 	bool "F2FS IO tracer"
 	depends on F2FS_FS
 	depends on FUNCTION_TRACER
+	depends on TRACING_ALLOW_PRINTK
 	help
 	  F2FS IO trace is based on a function trace, which gathers process
 	  information and block IO patterns in the filesystem level.
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 196607aaf653082..8abce95b0c95a0e 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -721,10 +721,15 @@ do {									\
 #define trace_printk(fmt, ...)				\
 do {							\
 	char _______STR[] = __stringify((__VA_ARGS__));	\
+							\
+	static_assert(					\
+		IS_ENABLED(CONFIG_TRACING_ALLOW_PRINTK),\
+		"trace_printk called, please enable CONFIG_TRACING_ALLOW_PRINTK."); \
+							\
 	if (sizeof(_______STR) > 3)			\
 		do_trace_printk(fmt, ##__VA_ARGS__);	\
 	else						\
-		trace_puts(fmt);			\
+		do_trace_puts(fmt);			\
 } while (0)
 
 #define do_trace_printk(fmt, args...)					\
@@ -773,6 +778,13 @@ int __trace_printk(unsigned long ip, const char *fmt, ...);
  */
 
 #define trace_puts(str) ({						\
+	static_assert(							\
+		IS_ENABLED(CONFIG_TRACING_ALLOW_PRINTK),		\
+		"trace_puts called, please enable CONFIG_TRACING_ALLOW_PRINTK."); \
+	do_trace_puts(str);						\
+})
+
+#define do_trace_puts(str) ({						\
 	static const char *trace_printk_fmt __used			\
 		__attribute__((section("__trace_printk_fmt"))) =	\
 		__builtin_constant_p(str) ? str : NULL;			\
@@ -794,6 +806,9 @@ extern void trace_dump_stack(int skip);
  */
 #define ftrace_vprintk(fmt, vargs)					\
 do {									\
+	static_assert(							\
+		IS_ENABLED(CONFIG_TRACING_ALLOW_PRINTK),		\
+		"ftrace_vprintk called, please enable CONFIG_TRACING_ALLOW_PRINTK."); \
 	if (__builtin_constant_p(fmt)) {				\
 		static const char *trace_printk_fmt __used		\
 		  __attribute__((section("__trace_printk_fmt"))) =	\
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index a4020c0b4508c99..971b6035b197823 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -111,6 +111,15 @@ config GENERIC_TRACER
 	bool
 	select TRACING
 
+config TRACING_ALLOW_PRINTK
+	bool "Allow trace_printk"
+	default y if DEBUG_KERNEL
+	depends on TRACING
+	help
+	  trace_printk is only meant as a debugging tool. If this option is
+	  set to n, the kernel will generate a build-time error if trace_printk
+	  is used.
+
 #
 # Minimum requirements an architecture has to meet for us to
 # be able to offer generic tracing facilities:
@@ -686,6 +695,7 @@ config TRACEPOINT_BENCHMARK
 config RING_BUFFER_BENCHMARK
 	tristate "Ring buffer benchmark stress tester"
 	depends on RING_BUFFER
+	depends on TRACING_ALLOW_PRINTK
 	help
 	  This option creates a test to stress the ring buffer and benchmark it.
 	  It creates its own ring buffer such that it will not interfere with
diff --git a/samples/Kconfig b/samples/Kconfig
index 0ed6e4d71d87b16..6b1ade57f00dd5d 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -19,6 +19,7 @@ config SAMPLE_TRACE_EVENTS
 config SAMPLE_TRACE_PRINTK
         tristate "Build trace_printk module - tests various trace_printk formats"
 	depends on EVENT_TRACING && m
+	depends on TRACING_ALLOW_PRINTK
 	help
 	 This builds a module that calls trace_printk() and can be used to
 	 test various trace_printk() calls from a module.
@@ -26,6 +27,7 @@ config SAMPLE_TRACE_PRINTK
 config SAMPLE_FTRACE_DIRECT
 	tristate "Build register_ftrace_direct() example"
 	depends on DYNAMIC_FTRACE_WITH_DIRECT_CALLS && m
+	depends on TRACING_ALLOW_PRINTK
 	depends on X86_64 # has x86_64 inlined asm
 	help
 	  This builds an ftrace direct function example
-- 
2.27.0.212.ge8ba1cc988-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
