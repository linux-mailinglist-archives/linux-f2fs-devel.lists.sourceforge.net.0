Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E116320BF26
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jun 2020 09:03:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jp4sL-00077A-0U; Sat, 27 Jun 2020 07:03:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <drinkcat@chromium.org>) id 1jp4sJ-00076z-Ng
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Jun 2020 07:03:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IRWxMxlqWvctwl99wxccnqWWb3ENVUA6Lf341j4JzdE=; b=C5qQAwd8nOy7xUXoe9iju7CNef
 ZqDCs2TRaGb/RcKS5E6jsF/BOUhZkp6Rb7ykB9nc6EHeRlhT9F2HAstG/I0RB5RptTlz9pvh1MiDA
 Dr9mMxp69/Nd+kKpqzDReHQQ7HEBmuQcUxaoBGGm48G+yy1UiWOudUA0ppTkL4QvhRbc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IRWxMxlqWvctwl99wxccnqWWb3ENVUA6Lf341j4JzdE=; b=WWhyUz7sEM5VoCgy6mX538FkXX
 0OI/W6s7+KoOjc5z+qKJwz+BFlOXlFUoaqiubZlCsIns1nNfW4H1Z78KcbESg+pHFY5YPG+0ErakV
 y6PtcPK290nlwrpzm+1OJwK20U0ZZnvlXPfl6La/08NowRVE9T2tefooU/y8AEuhaeOw=;
Received: from mail-pl1-f193.google.com ([209.85.214.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jp4sF-002RNl-Sr
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Jun 2020 07:03:43 +0000
Received: by mail-pl1-f193.google.com with SMTP id k1so5131084pls.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 27 Jun 2020 00:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IRWxMxlqWvctwl99wxccnqWWb3ENVUA6Lf341j4JzdE=;
 b=i0jiET3+vZO/UFJlzvko7rrTS7QmWEyKiVb3ggUYOS/7e0IjEJzlzOnOZQNyLuowqO
 /b2qX+vjeZeDwvEH5keqR8JJJRVjME6vd0LHDtfSmDsVeomQpuZAiYT4EfCNRTa2SQHb
 3MdeP0EJZ5FWGwkT0YcN8ucODDkKTYtFt0oZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IRWxMxlqWvctwl99wxccnqWWb3ENVUA6Lf341j4JzdE=;
 b=UL4O4+96yQLTFR5nsppH1CbvGeijSmkv8NPYVa5d5HLyjngmXj6HRC5H8StGgfsmES
 zXi+9/NBhllLL0abS6TsiydnD7pLhaFr+r73YKpiLM//7I8KSgTQ5BtdYgVeIAjgkMCX
 p4NR6Z+RSfaJZqUfig2QpfXcylDPuPKXMN3Bm3AwYjTawH+J615Y7xWgVIX5mY5cABpw
 qdHhFiMW1xQpFFh0+XKoA6c5Kc33g/9R7ncFRT5aEd4jWsfaa3SasXmA8YsSNtH2DyMa
 TkC1BLQcOCJvP3moV5DtDjAM6D6/JgNxu5QxJiwdpkMpIaqcj9orLFV9VbOl+XrESJGG
 jrxg==
X-Gm-Message-State: AOAM530GARRUWvsSb+tWuzgM9jsC1dnJpEivcN+SOxM42MOO9uDb+K0O
 9W0+/OdBRkRrmqUOafuPKmwyfA==
X-Google-Smtp-Source: ABdhPJxpdGUdXoc2rz4cG0DRuW8Y+uArwwEZjCgqEOXBTcgjaJufBTwP5w8TUOFoJoJC34+HTXYVOg==
X-Received: by 2002:a17:90a:bf14:: with SMTP id
 c20mr7337079pjs.228.1593241414364; 
 Sat, 27 Jun 2020 00:03:34 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id u4sm28133269pfl.102.2020.06.27.00.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2020 00:03:33 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Sat, 27 Jun 2020 15:03:04 +0800
Message-Id: <20200627070307.516803-2-drinkcat@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200627070307.516803-1-drinkcat@chromium.org>
References: <20200627070307.516803-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.193 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jp4sF-002RNl-Sr
Subject: [f2fs-dev] [PATCH 1/4] usb: cdns3: gadget: Replace trace_printk by
 dev_dbg
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
call with dev_dbg.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---

Unclear why a trace_printk was used in the first place, it's
possible that some rate-limiting is necessary here.

 drivers/usb/cdns3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 5e24c2e57c0d8c8..c303ab7c62d1651 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -421,7 +421,7 @@ static int cdns3_start_all_request(struct cdns3_device *priv_dev,
 		if ((priv_req->flags & REQUEST_INTERNAL) ||
 		    (priv_ep->flags & EP_TDLCHK_EN) ||
 			priv_ep->use_streams) {
-			trace_printk("Blocking external request\n");
+			dev_dbg(priv_dev->dev, "Blocking external request\n");
 			return ret;
 		}
 	}
-- 
2.27.0.212.ge8ba1cc988-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
