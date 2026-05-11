Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCpZAyjjAWoqmAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2026 16:09:44 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C46850FC01
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2026 16:09:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLlAFJukto5l/9kiS+ph4TMJMeMrb6Xpzty4mjV2bbI=; b=Owpnr/2sN2NxWBoG4b+7e6gocA
	z8/NmAhtpzgj7UtSQ/1QTou3FdB3FMIwu/NOhwDTT7kOPmEblbJAnqEubscKhzltk0YcHXuLA9SYx
	ycDYSyAZWeP5lwrk0jVk8B8uLIZJJKMeF+0zxrrhhTYuJbKqL/NAtrQW3qu0ayQ+LJNs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wMRK0-0004Ut-Pq;
	Mon, 11 May 2026 14:09:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1wMRJz-0004Uk-9Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 May 2026 14:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MybDLA0M88E7IeJ4Rz0ySX2LotuSJweshEDKSMCN3Yc=; b=JquGWwZu2+k2pv1s5FC+p6bxa+
 Nn83q2QLgvETDWCPWGPdryWXC5G56szUREVLMHh4C61t4P6iZY/L4Py6NLu/hTcIy1kwqTh+EShRY
 Pgp06PY+3FtHdGen9KF7Bq8s5seE2a9rX5sRaEU7zomFRBmygIKaJKiHsQ91/jZ3+CkQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MybDLA0M88E7IeJ4Rz0ySX2LotuSJweshEDKSMCN3Yc=; b=SRlA8Jp7JGz/osbOBF1Rc0Y+Pr
 d8r46pkWYuUbFj0JEgextzTnWrranns+WfdBCNVsH39xEdvuXG5IFTioQGhJNiOaRKJB9XL+3Yz81
 VIH3WrV6m3eCU8MjUd7yk1LtMxrGmr6mmjzAexso3N002qUxZS1GPr6hiDxSW0fq1eQg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wMRJy-00030m-1S for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 May 2026 14:09:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AA31943715;
 Mon, 11 May 2026 14:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A9CC2BCB0;
 Mon, 11 May 2026 14:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778508171;
 bh=0UpJUGzPjFdRF+kzA5dFbDzrBSNpqPmuECOqes5zOLs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=foKLY5sKZ8pQXRuGHvimXnKVPDHujO7i9DUihew18ywt0UUkKvpcWEQ+GENjB0qNO
 NgxndUmM3WbrU08K5mm4wnFTJzeITiV9PHxDxNnq613Oo6dgzvUTfJ4/75GXQsn15r
 NJlH33gFSvNWgiZUBBYLjmXsJCL/6Obf0osLgh9dqAWq2pC9UmW+zvU5SZ3p1gFd4H
 9NTj/zHhF5SO3FGYLW42EKJjAe385+WS/DGrVUPgWh3nDkDhNJFaBUjjA4e2Hgsvor
 uPWR9IEwYD3MjdS9lV9YT2EinL9WsEwAuTWPBfysgN3ObitBAk5eEIS1jm4hwLXEn6
 xgJjFWUK5GBCA==
To: Chuck Lever <chuck.lever@oracle.com>
Date: Mon, 11 May 2026 16:02:31 +0200
Message-ID: <20260511-wertverlust-vorbringen-070f016f3bd4@brauner>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507-case-sensitivity-v14-0-e62cc8200435@oracle.com>
References: <20260507-case-sensitivity-v14-0-e62cc8200435@oracle.com>
C: Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2738; i=brauner@kernel.org;
 h=from:subject:message-id; bh=0UpJUGzPjFdRF+kzA5dFbDzrBSNpqPmuECOqes5zOLs=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQxPmzoE7cS0pi4htne4BtrZubeg2uf/OBf+WBFQOp93
 w71crk5HaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABMp2cbIMEfiXshT9YRVMeHy
 0dt39r6+sDHh9aLmwo1tk7ifh+3OYWNk+HUvYr/S77VKu596N6437xR9oNG88+uX37/zSzhErP7
 +YAYA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 07 May 2026 04:52:53 -0400,
 Chuck Lever wrote: > Christian, 
 let's lock this one in. I will post subsequent changes > as delta patches.
 > > Following on from: > > https://lore.kernel.org/linux- [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wMRJy-00030m-1S
Subject: Re: [f2fs-dev] [PATCH v14 00/15] Exposing case folding behavior
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: pc@manguebit.org, yuezhang.mo@sony.com, cem@kernel.org,
 Roland Mainz <roland.mainz@nrubsig.org>,
 almaz.alexandrovich@paragon-software.com, adilger.kernel@dilger.ca,
 linux-cifs@vger.kernel.org, sfrench@samba.org, slava@dubeyko.com,
 "Darrick J. Wong" <djwong@kernel.org>, linux-ext4@vger.kernel.org,
 linkinjeon@kernel.org, Steve French <stfrench@microsoft.com>,
 sprasad@microsoft.com, frank.li@vivo.com, linux-nfs@vger.kernel.org,
 ronniesahlberg@gmail.com, glaubitz@physik.fu-berlin.de, jaegeuk@kernel.org,
 hirofumi@mail.parknet.co.jp, Christian Brauner <brauner@kernel.org>,
 tytso@mit.edu, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, hansg@kernel.org, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 6C46850FC01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chuck.lever@oracle.com,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:roland.mainz@nrubsig.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:djwong@kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:stfrench@microsoft.com,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:linux-nfs@vger.kernel.org,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:brauner@kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[32];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[manguebit.org,sony.com,kernel.org,nrubsig.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,samsung.com];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[brauner@kernel.org]
X-Rspamd-Action: no action

On Thu, 07 May 2026 04:52:53 -0400, Chuck Lever wrote:
> Christian, let's lock this one in. I will post subsequent changes
> as delta patches.
> 
> Following on from:
> 
> https://lore.kernel.org/linux-nfs/20251021-zypressen-bazillus-545a44af57fd@brauner/T/#m0ba197d75b7921d994cf284f3cef3a62abb11aaa
> 
> [...]

Applied to the vfs-7.2.exportfs branch of the vfs/vfs.git tree.
Patches in the vfs-7.2.exportfs branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-7.2.exportfs

[01/15] fs: Move file_kattr initialization to callers
        https://git.kernel.org/vfs/vfs/c/9d3942fa6a55
[02/15] fs: Add case sensitivity flags to file_kattr
        https://git.kernel.org/vfs/vfs/c/72504a889e52
[03/15] fat: Implement fileattr_get for case sensitivity
        https://git.kernel.org/vfs/vfs/c/d0d06cfce960
[04/15] exfat: Implement fileattr_get for case sensitivity
        https://git.kernel.org/vfs/vfs/c/64a4f2090cb2
[05/15] ntfs3: Implement fileattr_get for case sensitivity
        https://git.kernel.org/vfs/vfs/c/5fff53318cbf
[06/15] hfs: Implement fileattr_get for case sensitivity
        https://git.kernel.org/vfs/vfs/c/1b25c01375e0
[07/15] hfsplus: Report case sensitivity in fileattr_get
        https://git.kernel.org/vfs/vfs/c/b9e976dd58ff
[08/15] xfs: Report case sensitivity in fileattr_get
        https://git.kernel.org/vfs/vfs/c/30617d630d2f
[09/15] cifs: Implement fileattr_get for case sensitivity
        https://git.kernel.org/vfs/vfs/c/0f372b05c80c
[10/15] nfs: Implement fileattr_get for case sensitivity
        https://git.kernel.org/vfs/vfs/c/3ca9954cdc04
[11/15] vboxsf: Implement fileattr_get for case sensitivity
        https://git.kernel.org/vfs/vfs/c/0f5f23d411ac
[12/15] isofs: Implement fileattr_get for case sensitivity
        https://git.kernel.org/vfs/vfs/c/d56f6094035c
[13/15] nfsd: Report export case-folding via NFSv3 PATHCONF
        https://git.kernel.org/vfs/vfs/c/5ca2c8f14428
[14/15] nfsd: Implement NFSv4 FATTR4_CASE_INSENSITIVE and FATTR4_CASE_PRESERVING
        https://git.kernel.org/vfs/vfs/c/62c9555937ca
[15/15] ksmbd: Report filesystem case sensitivity via FS_ATTRIBUTE_INFORMATION
        https://git.kernel.org/vfs/vfs/c/35188379f010


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
