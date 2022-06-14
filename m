Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD0254BE3B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jun 2022 01:18:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1FnI-0006O5-TD; Tue, 14 Jun 2022 23:17:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1o1FnH-0006Ny-UL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 23:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LQUAyBaYn+W9lKPsuozw0s92g7u70y/6TiuYuSfo7Rc=; b=ioP0pQpykXr44f3a+O4pi+UKNm
 J6EgCeF3wfALIoM9q8vSXrl1bRCIahZMjCz3jgKnnmbUube6r5Y626wC6GK6a4Rvz6IdqQcajYcFo
 wO8JlaKekO9xegF06A+IyyRg8LlnNmxG9GGyH4YVSuEP1tH3q9+SBwO5OwlAU39noHh8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LQUAyBaYn+W9lKPsuozw0s92g7u70y/6TiuYuSfo7Rc=; b=I
 HSm9pyAFgkmIdgFVDNMaYPKRmewaNSuX4jxU4s42evTbXN7dFd7S+BAyQjUcZAlYf2BN7vVGM5r5p
 iCyn6wlYBrPMhNeBKhu+ovD1lIqJj5c4KSZnRsknVA//NslsLxlqoY5taXRx4xAHogGHzu+86Rr9E
 mZ8rimU+m9N/4oX4=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o1FnD-001rAo-0x
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 23:17:54 +0000
Received: by mail-pf1-f170.google.com with SMTP id c196so9891714pfb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Jun 2022 16:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LQUAyBaYn+W9lKPsuozw0s92g7u70y/6TiuYuSfo7Rc=;
 b=xDuuznxiFAe2BI8GZPevxIhSGAw3pwmIu3CEfm33xht2gNy6pL/L3FW7OfDMHmLm5H
 aH7HBKfBd/xVyFdpgwmye2DqvkSwNyhoX1MDHjN6l//ajjyLnCED6B69Bp7uhpzx+LIn
 uloSqJR54XVHM7HJgMPaDLPXvNy/0jKXYsvvYDiz4vyfTZ5s8ji8OghFR+JITwJrC0wV
 goIBzP3l5NFmwtPNJn6fUI8UKpydyftqqcr4kstXPJJPOaUt8u8Sp/QFg9jpXbvj3LY8
 CRtWbWqqsjxuBHolnMCmd2RS9XHmEQ7X/+70tYGO7W+/fZ6PgVB7GUFU9v76rg/M+LRg
 gnSg==
X-Gm-Message-State: AOAM531l4hpRj9eHOgQqF2IW2QPAJGEAk9Hy2QOTSKM0U8uHYAEkYF85
 8wybOu0OjOaSTpr/jx5VAPs=
X-Google-Smtp-Source: ABdhPJxLgompnBGrOikX+2U9t9pYLKgpBw99+p56jowd+kA2GHr5uykzdvWwOd0XquQbUp/DuCcKAQ==
X-Received: by 2002:a05:6a00:4297:b0:51c:2fa8:a5cc with SMTP id
 bx23-20020a056a00429700b0051c2fa8a5ccmr6986560pfb.37.1655248665319; 
 Tue, 14 Jun 2022 16:17:45 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:ab60:e1ea:e2eb:c1b6])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a1709028ec200b001621ce92196sm7769491plo.86.2022.06.14.16.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 16:17:44 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 14 Jun 2022 16:17:21 -0700
Message-Id: <20220614231724.776264-1-bvanassche@acm.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk, This patch series fixes one issue reported by
 Peter Collingbourne and two issues I discovered by reading the zoned block
 device source code. Please consider these patches for inclusion in the
 official [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1o1FnD-001rAo-0x
Subject: [f2fs-dev] [PATCH 0/3] Three f2fs patches
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk,

This patch series fixes one issue reported by Peter Collingbourne and two
issues I discovered by reading the zoned block device source code. Please
consider these patches for inclusion in the official f2fs-tools repository.

Thanks,

Bart.

Bart Van Assche (3):
  Fix the struct f2fs_dentry_block size check
  Fix f2fs_report_zone()
  Improve compile-time type checking for f2fs_report_zone()

 include/f2fs_fs.h   |  6 ++++--
 lib/libf2fs_zoned.c | 21 +++++++++++++--------
 2 files changed, 17 insertions(+), 10 deletions(-)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
