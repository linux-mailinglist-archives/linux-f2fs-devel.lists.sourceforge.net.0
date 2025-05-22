Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A303AC1354
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 May 2025 20:27:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S49pQdSF8KlcnlzkdOtHlnBJtbFa+Qt2NdlkqhiVLuE=; b=CAu94nVKgKWeEuNtlEhTUdT0/7
	upN+Jhay7+S+VFEsDhL9GtUmMUIcYl8SiH/v1ALarh6j9Yw0t/qaCnVN+aAQAeHfcqLHCa7QF6mIJ
	bgR77Z+MNYnBLfb5pKms9NnKL2VRWffr9lCaNZh3N24hudzQCl0Aqisup96A9fOAy3iw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uIAdD-00089i-Ap;
	Thu, 22 May 2025 18:27:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1uIAdC-00089c-FK
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 May 2025 18:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2K2QIVS99mHYrAj/FvKpKS0oerqBU4OZaRtyPiB5lEI=; b=Bq797LM/mBJRDZVjQCOKUrxvck
 307KmHj4jwjCwUFF7BYpjQuoM12u8z3JMrKef8JrKPnp4Dl++6yokuRwcFt4OlC4JFJIb2N1PFRvz
 tfEdKo9etbcZhU1IMBxYl1HWnezvTgalX/3QHsBj+LB/cXzEFlCtFTsG0s70tSWjowtg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2K2QIVS99mHYrAj/FvKpKS0oerqBU4OZaRtyPiB5lEI=; b=I
 60KO62TCL/J0VzemD0/jWELZrGm3rvzdHzMrQc7PW+xUxwWLAlO7iRzrgv2/48eB/RYmziprlhNXY
 jSeHIepWeXNx81rc+wmNo9t+Qzs/qURlMpx7NcSkREVUC+/CixhMbij8bmNBcjkUqWZkqWA1LO4Ad
 ItFS/uFIacrjyqBI=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uIAdB-0004N4-P7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 May 2025 18:27:02 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-309fac646adso178485a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 May 2025 11:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747938411; x=1748543211; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2K2QIVS99mHYrAj/FvKpKS0oerqBU4OZaRtyPiB5lEI=;
 b=kp7YilIs5PATIqfX3i+nxXCP9wl4Fmvx3vkscH6fimWNbhG482sVo3eZnTmfi8qAbW
 Hj8Le3vS3we4dBX31wRGNADKWlLgXNcMZuQWLhqWF9TZZGFwR1HXaQs/b7JzAiIZc+qs
 U/Xov9nkrnVL813/bR0/oH5ubJBQ646K5CvwvT2X7pXOrVgApFza0sAq6tRbQIwsGbBD
 C6029LfXWAovfcNt2zK8r5cuCyAWRf/m9udCtEbXYLrTU1NBovyzvO4ZRO74WBzbOolL
 /02/RRbe+mv4IIS8FhbM3m/QEFuFRoA4Fih9ydBbXKabPhDB91z4i9c6+Zb3hLy5rb5M
 6BXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747938411; x=1748543211;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2K2QIVS99mHYrAj/FvKpKS0oerqBU4OZaRtyPiB5lEI=;
 b=PWWcEgbRMKSdcleHeiKlO16kGekHWgnHWBDDsv1LRNxBYFMlq0CUAoK5+qT8RzOueK
 9sM0Our9imu4oFI8ab1Ihj2W6x/fKLi9M8yggtB9yLSvQynG2ngVa7sGritYqffyHGX+
 2/lZSqumJG5mSZLIUKgp7mQRnHheLo6p45TgbAHF6ATAst9YUk/U1vG//sgmCYrbUZCt
 BvyfM9ybFynQ5EKqeOEMvY63fue5tsMHdsBrjSYBziyLS4bBtpEIRphY7ilDdvcRirQW
 0zpfv+XIpU0gfmZLmnxGv9ydC0ObsQ1GSZrIRbaO7A7maU59RkjccGLPBi5bJC731Lm5
 vkCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn0Eix03s2ZX+VWeZiekAdfEqPPezNH5SBFNomdPgXjkf4ZCnOao2mzUgfX+sF1Ai9m3UQtfhT3NqbxDimWdfE@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwDCG34TsnLc9GEYlVZuyYeo5aw4Wh4ry/2EEpHNzNkHCJZiFwW
 Hu4qX92okSPdQ3NSQkZQR37Kdv2twtMqcAHEKGQDWTUnjXlebupTOYN+
X-Gm-Gg: ASbGncsg1DIPWgqZdDJKWj69Exc0KvN9wUezuJzqkq0fOVEBLWQnantHTBRuomrZomA
 jcXZ2qV9ks09QCDCO6EyQ0tVBMxULaT3jmx+YiifWj9jjQ/txEJHsKtgbNwWrFzWlptGQkUMxBB
 YaOcRGhU4rCelZYXhAeBNCSoAP109alCKD8tT/2LgxvPuol8HVjAf5Y5iKoAAgslww6OqzM1OQt
 lwEdGqZpDmx8yhKvJNst/ns+6tztunxQkOdcmXWRiBg/0PP223DoiNcbIFEmPyHNYBnDOoYq6Q6
 4/vCLP07lxXsEEUty2hAkXj+DQ41kTUKV2yGDboE07M6aYMtU+E7NItJSl9hCoVnza1ze1Ya+IJ
 YfU8VXd3Gs9Zb5X3Or29KIn3rKDx5E9xzGNo/xdhF8rk=
X-Google-Smtp-Source: AGHT+IEh2ADohNRqeXlFfITgVLoWV5fRFAHgFet8g4ue+tsRIJm2qGxJYt4lOr5PR1UH9cOcPo7YOA==
X-Received: by 2002:a17:90a:e7c4:b0:310:7486:d60b with SMTP id
 98e67ed59e1d1-310e89008f4mr650636a91.14.1747938411036; 
 Thu, 22 May 2025 11:26:51 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:8127:b563:a3a1:d465])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-310cec3f320sm1348049a91.9.2025.05.22.11.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 11:26:50 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 22 May 2025 11:26:44 -0700
Message-ID: <20250522182644.2176645-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong Otherwise, it doesn't work with a crash.
 Signed-off-by: Daeho Jeong --- v2: relocate the code --- lib/libf2fs.c |
 5 +++++ 1 file changed, 5 insertions(+) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.45 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.45 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.45 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uIAdB-0004N4-P7
Subject: [f2fs-dev] [PATCH v2] mkfs.f2fs: ensure zone size is equal or
 bigger than segment size
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Otherwise, it doesn't work with a crash.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: relocate the code
---
 lib/libf2fs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index d2579d7..148dc12 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1347,6 +1347,11 @@ int f2fs_get_f2fs_info(void)
 			}
 			c.zone_blocks = c.devices[i].zone_blocks;
 		}
+		if (c.zone_blocks < DEFAULT_BLOCKS_PER_SEGMENT) {
+			MSG(0, "\tError: zone size should not be less "
+				"than segment size\n");
+			return -1;
+		}
 
 		/*
 		 * Align sections to the device zone size and align F2FS zones
-- 
2.49.0.1151.ga128411c76-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
