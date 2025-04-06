Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25987A7CD47
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  6 Apr 2025 10:23:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u1LHL-0004SA-T2;
	Sun, 06 Apr 2025 08:22:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <uplinkr@airmail.cc>) id 1u1LHK-0004Rx-Jf
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 06 Apr 2025 08:22:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:Subject:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BVaq7iM/Gz0XALwtPEtO3G1feGhZo8yBFVA1NGF6Hmg=; b=Fi2WL97biN3gSjJ3U0zDmJlluk
 yJ2cxUKOtmOYVPfYIuoAQvcBqwUJpTktIN3XFAkQ+mc8EdvkI3XOwaOnUXpwmhM8+KuWza8CQE86u
 O5ubwQdPrEiO/SMEpC6rCzO6XwMsLimx5f63B4/+W3OwdanLU95z2KMwgmF06aqRbyt4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:Subject:To:From:Date:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BVaq7iM/Gz0XALwtPEtO3G1feGhZo8yBFVA1NGF6Hmg=; b=f
 cE6yNbAQaABZrcJ6l2xuPlg82Loja3GEGaoauFtP0ybpYI9k2setXlrlGH/CW+1gaS64IE3Oq07Cg
 QHM6sqLLEeGiVM6ugc+ijevpGD/jvAv2Wm9GwIOKWDZ+yexSmCGpPPkh8M1ZSSKj+F7mAfW9hsMhM
 Gi+wkAY+ACuMQ0nA=;
Received: from mail.cock.li ([37.120.193.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u1LH4-0006Zq-RC for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 06 Apr 2025 08:22:55 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
 t=1743926643; bh=ZijApVfBPMbCQjywZvObA7rqKM86p/6iC/9+o/gsh8I=;
 h=Date:From:To:Subject:From;
 b=flQoWPTGAtZt4LcPO3K3jK/gwR7z207k6WMVs1y3zBtHaptn/YwI9YwDtt2Wa8VW3
 BzluquLmOXpyNTIeLEvSPZzMRKadLdRS/aA0KS0F9p/aELA+Kiqoq/JY2bdFGBK3DU
 BrK2jZTgNp2a9qLnEnM9bZ1RYPn1cQd7zPr4gOxZtHVtbrxxNHmSHbw9QrQ1lkObIv
 18InajXw78+4VoBOaxznmVb7wICUGEQM6HmsoUVFONqFg+CF2XZ602n6RwLWkfG9Tw
 L0HAoiG6wwJzdeTfzK91LbGfMSW4xTgnbb9l/ncpKbiyqzz+o5shdcHpkKwT/N55DY
 VfX94DGCCtMkw==
Date: Sun, 06 Apr 2025 08:04:03 +0000
To: linux-f2fs-devel@lists.sourceforge.net
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <88f281ff9ff9b1fb899c92d6b32f52b7@airmail.cc>
X-Sender: uplinkr@airmail.cc
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello everyone, I am having trouble with F2FS. Specifically, 
 I believe metadata got corrupted when I resized it. I have a 512 GB drive.
 My F2FS partition was approximately located on 369-497 GB (128 GB size).
 Using G [...] 
 Content analysis details:   (0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 URIBL_DM_SURBL         Contains an URL listed in the DM SURBL blocklist
 [URIs: airmail.cc]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [37.120.193.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [37.120.193.124 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1u1LH4-0006Zq-RC
Subject: [f2fs-dev] Resize metadata corruption
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
From: uplinkr--- via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: uplinkr@airmail.cc
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello everyone,

I am having trouble with F2FS. Specifically, I believe metadata got 
corrupted when I resized it. I have a 512 GB drive. My F2FS partition 
was approximately located on 369-497 GB (128 GB size). Using GParted, I 
resized it to 0.5-497 GB. While the partition resizing went through 
successfully, filesystem resizing initially failed with "Mount unclean 
image to replay log". I have done that and retried resizing.

Afterwards, however, fsck started giving out a lot of errors, at one 
point it asked if I wished to restore lost data, which I agreed to. Logs 
specified a lot of my files (which I could tell by filenames) and 
mid-way through the process, it segfaulted. Now, when I run fsck, no 
files are asked to be restored, and it completes successfully. However, 
when I attempt to mount it, I get an error saying "Structure needs 
cleaning".

Could someone help me restore my metadata (at least, long enough to 
extract my files)? Thanks.

dmesg logs:

[   96.184127] F2FS-fs (nvme0n1p5): Mismatch valid blocks 769 vs. 68
[   96.188050] F2FS-fs (nvme0n1p5): Failed to initialize F2FS segment 
manager (-117)

fsck.f2fs --dry-run -d 3 logs: https://arter.com/.f2fs-20250406/fsck.log


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
