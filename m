Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 523048D358C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 May 2024 13:28:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCHTc-00076Y-49;
	Wed, 29 May 2024 11:28:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sCHTZ-00076K-N0
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 11:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PWV5ADdGn81LhpSzLHudQHa8fvEJvm5AkFMDkZeRRJY=; b=AE/DHw8Gc15QyGyrZkCrR9+1C5
 3rewXyc/cXu/KgMJCtIhaYJsNbVjDczdYcadugfFcwBNqvyMLZEECGzfW7jMWc2GaQjLTf1S0hTlW
 Pt8Ppmj66MbOHdgKWrSwtWYvE1GWW/ILxNJ03xfEBb0RIPpKi9Z5CJJB0FoouAHCZ30A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PWV5ADdGn81LhpSzLHudQHa8fvEJvm5AkFMDkZeRRJY=; b=HNPJ4X9IkqAZ3kR2DtKDpzBVvS
 M9Y9tVuZxqUONejKBUrRiNGKAtptF/+eugPHrMGryV1rqSC4m+/kURWavO+uRsOv+69pL2ERDi74j
 +URJl9OaC2blp4X30WyImcP12SK2dGhnqZ5SdLvnNCkzXqPcZOK6DPaB9od0aqj5BKWE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sCHTa-0006V3-5e for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 11:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1219A6269D;
 Wed, 29 May 2024 11:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB872C2BD10;
 Wed, 29 May 2024 11:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716982082;
 bh=imM6wbNNhDFQlLHh0hY4tc0Miuy2SbOfK3Altmz/hTE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qG1vIyCFCXlKWhycFd8PcMeYW3rjgS98w2/IWF+vnLkVlY8w5ToOC7xZNYIUocG2X
 biGrO0fPEIujMI0xnXPtU+ad4IPnEyXxUPpwfVB8JNlX8nS+JxpsZxl25lvHpl967+
 GItEyHPQTJRMRGJAeaWz98N720m4uSoKy42LFE6rAdgfJWU2depscf73CF6a39R2L3
 cAKcoM/Q532yHFbXat5NyEQvd9BJ1Nt9RKusRsYZ27GE9YY/8zWpMh90cz/a+jeFoV
 DI/L5mWhqeWaGTmXjbZ1fs8gxEKhxR464EHcsrCSSZY8Y18ZJSrveYZEc1j8NrOMNM
 ksoyTLtIi9X+Q==
Message-ID: <674665d7-33b5-4c33-afd8-637222ebf04c@kernel.org>
Date: Wed, 29 May 2024 19:27:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20240529112411.380453-1-shengyong@oppo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240529112411.380453-1-shengyong@oppo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/5/29 19:24, Sheng Yong wrote: > If curseg is not the
 first segment in its zone, the zone is not empty, > and it should not be
 reset. This issue could be reproduced by: > > modprobe null_blk nr [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sCHTa-0006V3-5e
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid resetting non empty zone
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/5/29 19:24, Sheng Yong wrote:
> If curseg is not the first segment in its zone, the zone is not empty,
> and it should not be reset. This issue could be reproduced by:
> 
> 	modprobe null_blk nr_devices=1 zoned=1 zone_max_open=6 zone_max_active=6 zone_size=1024 gb=30
> 	# /dev/vda is 4G
> 	mkfs.f2fs -m -c /dev/nullb0 /dev/vda -f
> 
> 	while :; do
> 		mount /dev/vda /mnt/
> 		dd if=/dev/zero of=/mnt/file bs=4K count=11 conv=fsync status=none
> 		if [ $? -ne 0 ]; then
> 			umount /mnt
> 			break
> 		fi
> 		f2fs_io shutdown 1 /mnt/file
> 		umount /mnt
> 	done
> 
> And the error looks like:
> [  123.169852] I/O error, dev nullb0, sector 41951232 op 0x1:(WRITE) flags 0x800 phys_seg 10 prio class 0
> [  123.173070] F2FS-fs (vda): do_checkpoint failed err:-5, stop checkpoint
> dd: error writing '/mnt/testfile': Input/output error
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
