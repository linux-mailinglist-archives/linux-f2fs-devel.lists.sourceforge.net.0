Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9E320BF2C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jun 2020 09:03:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jp4sS-0001Rb-Rt; Sat, 27 Jun 2020 07:03:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <drinkcat@chromium.org>) id 1jp4sR-0001RR-BD
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Jun 2020 07:03:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GEZGJe51GehcxNBEXCjeuCvNUVTUbWGMU9LfdoST7kI=; b=nNSuVpw1hwn3OF+AcCbtI3fZ8d
 hLcn8gDmdw4gF0thgRJcZ8DEz0XQSaT6edT6dTItUJClEyjB+mkY2hONnWuIOQTlgF6K/FXNd3NUH
 Lv7iOa2lRbUr3vwxK55Fq8wqlNiUP9CrAIeg4NY8KAur2LGbG9iOhrEE8lG5NzH/NIhE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GEZGJe51GehcxNBEXCjeuCvNUVTUbWGMU9LfdoST7kI=; b=HqKp80KKahnEotmt0WEOXykd3D
 AMa1UbnGtpXmS/eD6oJN9WwbLhrG/S588EjKf3E1IFjyRIfrqNTp4J8f7iDyVnfysxStFUUJTn+lS
 v3sV9W6f101kUzHlSeaOdivEtzZhkHBiBXZulIPYwgl2Kvr7zbxCL3Dqv2w5VENlw6L8=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jp4sN-00H3qt-4l
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Jun 2020 07:03:51 +0000
Received: by mail-pg1-f193.google.com with SMTP id d4so5989207pgk.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 27 Jun 2020 00:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GEZGJe51GehcxNBEXCjeuCvNUVTUbWGMU9LfdoST7kI=;
 b=cjXMwayPxAVThNdqSwq9gh/XXADf8DxfXH5Am4oMd6Gzkk3HKiuVeQBOjv3pA4go09
 GYrHH5eUSlGtVrxnx0CaKolfLkX8IWfanhhoBcg935mVJ6DKtduNPeSotSqrdDCloxin
 OJC8MRcaDRimzPxiRnmKyq3boKDUYPgFPV61o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GEZGJe51GehcxNBEXCjeuCvNUVTUbWGMU9LfdoST7kI=;
 b=gxYaPYvBx5YFsxAxaDRB5tfC7OjbSndPF04EFb1BB7p+PyFpO9Ed3fvzom86UlBZOE
 NgSKujEoJFN9x39uL1iWYUSaPBk+SxA4dMFocETo1zz7z93hsnDdM7UHHK+B+n8GiMhC
 vNowNXo87QgcfSG8XOYrIAqbcTkG0jZiVmDAjmfTaZSUniPlOjMZUY/dijtGNvFtxoc/
 vPJUf2pc1j0UsNFvEoGQ8Yh+tmkFYmUrqrvBBoCrdsCwb5GxT8kTlhOnFmVwKHAE/SAs
 hDjKE22bK1vUg0+ZWcmurWlDiymctt/xwbE6o9O/c8erqustW2w5FK1BV+P2pmR05LEQ
 0Jag==
X-Gm-Message-State: AOAM530e9A1qCTTZS0/+PUi/+zGAGvMlLeTcBYqRQMr8WmRBZ6N0PQkh
 a7pSZhkr4Fz2JvURMdHdApBSjA==
X-Google-Smtp-Source: ABdhPJzEaHy/nTKowjvtlIgATfBjZFG3DWxUouu/iNdEBoW9SD1bHdr7RU6EhcYh7ZY2/EGoj98Wdg==
X-Received: by 2002:aa7:82d5:: with SMTP id f21mr6259533pfn.244.1593241421610; 
 Sat, 27 Jun 2020 00:03:41 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id u4sm28133269pfl.102.2020.06.27.00.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2020 00:03:41 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Sat, 27 Jun 2020 15:03:05 +0800
Message-Id: <20200627070307.516803-3-drinkcat@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200627070307.516803-1-drinkcat@chromium.org>
References: <20200627070307.516803-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jp4sN-00H3qt-4l
Subject: [f2fs-dev] [PATCH 2/4] media: atomisp: Replace trace_printk by
 pr_info
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

trace_printk should not be used in production code, replace it
call with pr_info.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 42fef17798622f1..2bd39b4939f16d2 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -735,11 +735,11 @@ ia_css_ptr hmm_host_vaddr_to_hrt_vaddr(const void *ptr)
 
 void hmm_show_mem_stat(const char *func, const int line)
 {
-	trace_printk("tol_cnt=%d usr_size=%d res_size=%d res_cnt=%d sys_size=%d  dyc_thr=%d dyc_size=%d.\n",
-		     hmm_mem_stat.tol_cnt,
-		     hmm_mem_stat.usr_size, hmm_mem_stat.res_size,
-		     hmm_mem_stat.res_cnt, hmm_mem_stat.sys_size,
-		     hmm_mem_stat.dyc_thr, hmm_mem_stat.dyc_size);
+	pr_info("tol_cnt=%d usr_size=%d res_size=%d res_cnt=%d sys_size=%d  dyc_thr=%d dyc_size=%d.\n",
+		hmm_mem_stat.tol_cnt,
+		hmm_mem_stat.usr_size, hmm_mem_stat.res_size,
+		hmm_mem_stat.res_cnt, hmm_mem_stat.sys_size,
+		hmm_mem_stat.dyc_thr, hmm_mem_stat.dyc_size);
 }
 
 void hmm_init_mem_stat(int res_pgnr, int dyc_en, int dyc_pgnr)
-- 
2.27.0.212.ge8ba1cc988-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
