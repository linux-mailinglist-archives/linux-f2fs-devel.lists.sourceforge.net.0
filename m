Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 345A3C5B42E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Nov 2025 05:02:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8mCDdoULlIcEfgxhPF3tniZDOribTeM5DPML3HcCFY=; b=jBnGK9RBaixe7ADYauU+a01nTp
	fEU/US1NwUniZ4F+JBfFMH2NafUE3hiRMhPELS+EzF03KvBE3ZjhMFMdwjWti13Vl+6Xi0jc48Wue
	fSnpNvc/PKEtdBmRWWcvrrQgqx0Fo0KWxmDrToalrGkxNyMVr00gbcGn1C5fPheBgRb8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vJl19-00044C-Js;
	Fri, 14 Nov 2025 04:02:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vJl18-000443-9V
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Nov 2025 04:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UponDoh0NmWvgcZt5aIKQ0WmFzfPH83AloKxYvrfBVc=; b=dB53dpw/h6So8u405G0Yg7dvTW
 8Umz75JANMkRmoqdoU1/7e+C/nQg8rIDV12kJYnCFaKjepHpW3pr2kkA8mVGxTxYtL68Q6jiyAI6K
 EPOgnGRNBe7g5lr0pkbF/9f/p5r3xHGtwq1YGcAhzGl2lodkGMNzBIzXS37cgfR/OaFw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UponDoh0NmWvgcZt5aIKQ0WmFzfPH83AloKxYvrfBVc=; b=R3MDQNW4iVqEeZlcg/EAJM4huk
 jDuGxVUc+ASXIZo0Ki7IZBor0LyZo8ZUFZPMU0wjCRocFmg8eNkXlFeBEmIMACUXNpAEkAmyF5TWv
 znRbNdRIUHzEq6tPxbslcIq4Dkj101WhEiPDjFJl+xxz4LqD88gYooE78NSPTHLvnLuo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vJl18-0007Y1-JC for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Nov 2025 04:02:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C5E2A60127;
 Fri, 14 Nov 2025 01:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFC1C4CEF7;
 Fri, 14 Nov 2025 01:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763084092;
 bh=YjMII5HUntbbCppXh7SUcDPnKk/b0aE0AtCer6ea34U=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=VyI0VutKKjAWkR0w6kJ+wDT16FkTSWUaXs9T5hfV49BU4bqQFFzdcKqqzpvPSbNHh
 atK2gAVi9FcNvWA1PP8fMHemyVievlz6y8L+10VNqgm5Bq31w/wtTRKTf7H3eBvSQV
 Eorft36TTM52oFVSYUrdOtQTXi8H0z2ns7I4Xa3hV7wXCwR39rNEaaNpACsK4aMOh2
 f+cXjVydxDrR0BqUIO6iH4LupL3w5lyPgHJjI+vK3FFFxHvSAjSjzPwd7oadzPm22n
 CWPGfUXimLnFsWz7DFwaDChj3iZLYNqt4z/BPSHx+vCE49kUguJCrCO6nsDN2Ytxnd
 0w6AQjL7dZVaQ==
Message-ID: <a9500c33-b259-4ff5-8411-997399a47358@kernel.org>
Date: Fri, 14 Nov 2025 09:34:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joanne Chang <joannechien@google.com>, Zorro Lang <zlang@kernel.org>,
 fstests@vger.kernel.org
References: <20251112135223.3467852-1-joannechien@google.com>
 <20251112135223.3467852-3-joannechien@google.com>
Content-Language: en-US
In-Reply-To: <20251112135223.3467852-3-joannechien@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/12/2025 9:52 PM, Joanne Chang wrote: > Currently,
 f2fs/019
 and f2fs/020 only clears MKFS_OPTIONS. This causes > the tests to fail when
 leftover MOUNT_OPTIONS depend on unapplied > MKFS_OPTIONS. [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vJl18-0007Y1-JC
Subject: Re: [f2fs-dev] [PATCH v1 3/3] f2fs/{019,
 020}: clear MOUNT_OPTIONS alongside MKFS_OPTIONS
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/12/2025 9:52 PM, Joanne Chang wrote:
> Currently, f2fs/019 and f2fs/020 only clears MKFS_OPTIONS. This causes
> the tests to fail when leftover MOUNT_OPTIONS depend on unapplied
> MKFS_OPTIONS. So MOUNT_OPTIONS should also be cleared to ensure reliable
> mounting.
> 
> Signed-off-by: Joanne Chang <joannechien@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
