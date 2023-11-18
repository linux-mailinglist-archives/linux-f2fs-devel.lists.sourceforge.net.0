Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 325427EFD35
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 Nov 2023 03:35:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r4BAq-0001o0-PG;
	Sat, 18 Nov 2023 02:35:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3ZxtYZQYKADAPdaeQZSaaSXQ.OaY@flex--drosen.bounces.google.com>)
 id 1r4BAn-0001ns-1O for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 Nov 2023 02:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OudNb3vyGckkWCRqMA6EKuyQcCNMJz/Wh4Wc36ODnxs=; b=LrSdeoV0IooSzjQ1cOP1UDvMQX
 ID29cUHmIcPaKuE4W0LmfYE61kwPhc6HetJdK7DhveKDU6vtEGHniMI2JRcwyuR/SE14uQeWmCw2Z
 MVcnM40D511HXknfQXwgLiFGdZOgKIWJhiPWJxmXrRgbWi1/HDKbL/NP/M6oL00k9vFU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OudNb3vyGckkWCRqMA6EKuyQcCNMJz/Wh4Wc36ODnxs=; b=D
 4nuoyPtWzswqP2yXbscxVm8z+dtRDD/4GGeNgQf+wmNctnv0VucnXCEh/yL2XN+8UwRWUXA5+aEuy
 sICd/bNFIYYzzmv/CYiIWxy96mbf0vJIsf4tR88f8DtKU5wXvNDx1NHwt5QJtauwjefjfx7cLpjem
 c7XQM3QMemoHy7gs=;
Received: from mail-qv1-f74.google.com ([209.85.219.74])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r4BAk-0090U6-B4 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 Nov 2023 02:35:04 +0000
Received: by mail-qv1-f74.google.com with SMTP id
 6a1803df08f44-677f3c0bb78so1210096d6.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Nov 2023 18:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1700274896; x=1700879696;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OudNb3vyGckkWCRqMA6EKuyQcCNMJz/Wh4Wc36ODnxs=;
 b=ZgciIeI2TF8Vh4Wa+Q30bArJLtnuBroeN+Z7feLQRNl+qJTy2ExjC02/1qvkIiW7rg
 pXUwUCyPnV+c5oahnxTEhrmX4aCrj9f6AJ4tNX/ldv4hZx+EynpVAc+Z5k0jjMEkVXJb
 PHEJNnXkbYMChZi0zNZq7DsEYFm/82XvA9onqQw/iQPSBIrKKZBwKHjv8UyZ384ChQ98
 y0zBrk7N+hXVV56paOhFkkEgIP2sgeFhX1HrPhuGQXdDn8t6qVkl/rlIK8N0egcbrpTI
 R9+GfUzt4DV+No/onkc2JEWdv55LD+piBIkGhl/a8OHsIdJYS1I1NTw0xmuiSIUdGCJP
 WTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700274896; x=1700879696;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OudNb3vyGckkWCRqMA6EKuyQcCNMJz/Wh4Wc36ODnxs=;
 b=JKplP/4HyUx28vhX4f61w9/zXb3FNF1s2RpFpMWMgJp3ZYy2S+Q6q6LV2lhzqfdYn2
 0BRT+UNbMdfMdvnIMSXP8wDkOtrheEpqWrs48ekwbkZqq/aPs8H/U1Z5z2AKc0KqGkpN
 NJHm+reRk3aYZ9ew4Q9uJe1Jemgx842o0NXvD8S6lfyFfRQ5ohG6HwaOfXrABPQJI3of
 /YQKVboAkPpKPcwZDy/iWJVx61gJMjVfvoQGaRTWKOgc4uZtkB86oadB/Nneocw0SXsa
 P6ZxfCfoJq2MNS+/INCjRSwpnzljiMN7AIYlmUMtm04HUuiXr7qtRb3XWDNGq5Jy5ykz
 RRPA==
X-Gm-Message-State: AOJu0Yw810/5GoyXOL0dgIcnEK0hJdcY15iwUo+vipSMkO8CkOWRy2KA
 V37IubGE9KJ4gd5MXPH3zpygBtoTz5LlNn/X9oYEV8UK5na6Te70a29ifyCfX+1enQxgzJj9IxM
 tN+UP/EPks1QVh6o2+LJjDadlG5LkU5npmyohgskLhw/kMTVbwYyfqCBDX6YgDKvKDXPwvu/Rir
 KBlGtIzBs=
X-Google-Smtp-Source: AGHT+IGrEeqx3toQycaPHsn38coKr0R7r6LyWUyWlhDMawuih692Y05AWgISBP3+prgEVNjJladod362miE=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:5334:1f35:bdef:529b])
 (user=drosen job=sendgmr) by 2002:a25:d70f:0:b0:db3:5b0a:f274 with SMTP id
 o15-20020a25d70f000000b00db35b0af274mr31632ybg.0.1700272999249; Fri, 17 Nov
 2023 18:03:19 -0800 (PST)
Date: Fri, 17 Nov 2023 18:03:06 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
Message-ID: <20231118020309.1894531-1-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: I missed a couple things in my previous patch set. This fixes
 Quotas, the -c cache option, and a debug print. The issues can be seen by
 running: truncate test.dat --size 256M make_f2fs -g android -O project_quota,
 extra_attr
 -w 16384 -b 16384 test.dat 16384 fsck.f2fs -f -c 10000 --debug-cache test.dat
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.74 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.74 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1r4BAk-0090U6-B4
Subject: [f2fs-dev] [PATCH 0/3] F2FS Tools 16K Bug Fixes
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I missed a couple things in my previous patch set. This fixes Quotas,
the -c cache option, and a debug print. The issues can be seen by running:

truncate test.dat --size 256M
make_f2fs -g android -O project_quota,extra_attr -w 16384 -b 16384 test.dat 16384
fsck.f2fs -f -c 10000 --debug-cache test.dat

Daniel Rosenberg (3):
  f2fs-tools: Fix debug size print
  f2fs-tools: Wait for Block Size to initialize Cache
  f2fs-tools: Fix dqb_curspace to reflect blocksize

 fsck/fsck.c        | 3 ++-
 fsck/mount.c       | 5 +++++
 mkfs/f2fs_format.c | 4 ++--
 3 files changed, 9 insertions(+), 3 deletions(-)


base-commit: f71fbf8f3dee4eefdddac1abaaf4ae76bb9a48b3
-- 
2.43.0.rc0.421.g78406f8d94-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
