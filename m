Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8sVsHMScO2pzaQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 11:00:52 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFBA6BCC1C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 11:00:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=FEGK7YFM;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=BOBHMsL0;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=LY8+Zb7A;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=Cmfji3PW;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mcwC8lXYEMJ2Z/DJPeCqNb/HDP9X5aIuaJEuzYbk6U=; b=FEGK7YFMAyk3HkK2nDIlLzU49H
	iqGLX3DmwxS8WVnt36yrUv8dslbaNMiC0lw+RDfMwAZ7zUmLoSw/N7I3QFscYHV9XeETe54X3U430
	98oNpRO/w3jzHFnGZgnZNmF76k/iaCECj7IEqKFaRWKQ8jgRdq9LWE5hTPMLTY1W53I8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wcJTT-00078J-B5;
	Wed, 24 Jun 2026 09:00:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wcJTO-00077V-Qx
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 09:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DCKt4O2HlnFxHy8Mhm2C2zuPcXHOFrNOinuxD1UUcRc=; b=BOBHMsL0cFyOjFhfxKink/DjCI
 bS/T2Q2GQ/Z3Q0AF58uOzrFGRWN0C2egKhu+DMhy0IT7aDzUZqWNBolJ06yodPNqCHlBfGYXf3IRQ
 1DX6zvpOr1dY628U+uJzZbKapvbgCTlL0qGzdVw93GjGLwVn0KzkKznbCDGxC2ZCnntc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DCKt4O2HlnFxHy8Mhm2C2zuPcXHOFrNOinuxD1UUcRc=; b=LY8+Zb7AK76vRRzyChU/JpCUw+
 el5cDcSpvaOH8KOsBEhonso5TNR9hmMBCtkfYly7rMiOnEnMjt1tyJo6dhK0lfqVC+GYL+agh2gZ/
 Kp8u2R18A6p12wZ/uJI7VPqUlN2rnaVlDgkrUQ0k9wfi96Czq0AZXStbKM8QQswUjf7o=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wcJSZ-0000rD-Ty for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 09:00:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1646A42B72;
 Wed, 24 Jun 2026 08:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E931F00A3D;
 Wed, 24 Jun 2026 08:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782291587;
 bh=DCKt4O2HlnFxHy8Mhm2C2zuPcXHOFrNOinuxD1UUcRc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=Cmfji3PW0AVDGKQ4BufZEBDJWiQm1o8/rQsb7n4IPtwL2Bri4DpGeykggivNXbeKl
 bstR8Aj141x+SXVVytHk70wMVpKQ2bDQeC4RGdfuf925UT+hEoMCDYVxscMlqcrn3d
 6xnEmkWJdCUcpVMSWDpNGerH9VyGcglmIk/mUCMD0BiEP0cv0fwfWo3JgHR5YPVrnL
 Jte9tPT/yzkvqV00w5paETjF56VjF6ALEXGUBYhw0wOJsEeEWA+2CMVQPU75HFlWVo
 MQXB30pU37MXc/fscX12cEexVJBV1ND0Xny4mZBk5+ARKMHfjuwtW9baGkR7d+IuXL
 XUjSsQ4FUeCjg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 196D839EF964; Wed, 24 Jun 2026 08:59:37 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178229157577.2577930.354083176752004996.git-patchwork-notify@kernel.org>
Date: Wed, 24 Jun 2026 08:59:35 +0000
References: <20260217214741.1928576-1-cel@kernel.org>
In-Reply-To: <20260217214741.1928576-1-cel@kernel.org>
To: Chuck Lever <cel@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Christian Brauner <brauner@kernel.org>: On Tue, 17 Feb 2026 16:47:24 -0500
 you wrote: > From: Chuck Lever <chuck.lever@oracle.com> > > Following on
 from > >
 https://lore.kernel.org/linux-nfs/20251021-zypressen-bazillus-545a44af57fd@brauner/
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wcJSZ-0000rD-Ty
Subject: Re: [f2fs-dev] [PATCH v8 00/17] Subject: Exposing case folding
 behavior
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Cc: jack@suse.cz, pc@manguebit.org, yuezhang.mo@sony.com, cem@kernel.org,
 almaz.alexandrovich@paragon-software.com, adilger.kernel@dilger.ca,
 linux-cifs@vger.kernel.org, slava@dubeyko.com, linux-ext4@vger.kernel.org,
 linkinjeon@kernel.org, sprasad@microsoft.com, frank.li@vivo.com,
 linux-nfs@vger.kernel.org, viro@zeniv.linux.org.uk, ronniesahlberg@gmail.com,
 glaubitz@physik.fu-berlin.de, jaegeuk@kernel.org, linux-xfs@vger.kernel.org,
 hirofumi@mail.parknet.co.jp, brauner@kernel.org, tytso@mit.edu,
 linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 sfrench@samba.org, senozhatsky@chromium.org, chuck.lever@oracle.com,
 trondmy@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 sj1557.seo@samsung.com, hansg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cel@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:linux-nfs@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:linux-xfs@vger.kernel.org,m:hirofumi@mail.parknet.co.jp,m:brauner@kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:trondmy@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:hansg@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[suse.cz,manguebit.org,sony.com,kernel.org,paragon-software.com,dilger.ca,vger.kernel.org,dubeyko.com,microsoft.com,vivo.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,samba.org,chromium.org,oracle.com,samsung.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FFBA6BCC1C

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Christian Brauner <brauner@kernel.org>:

On Tue, 17 Feb 2026 16:47:24 -0500 you wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
> 
> Following on from
> 
> https://lore.kernel.org/linux-nfs/20251021-zypressen-bazillus-545a44af57fd@brauner/T/#m0ba197d75b7921d994cf284f3cef3a62abb11aaa
> 
> I'm attempting to implement enough support in the Linux VFS to
> enable file services like NFSD and ksmbd (and user space
> equivalents) to provide the actual status of case folding support
> in local file systems. The default behavior for local file systems
> not explicitly supported in this series is to reflect the usual
> POSIX behaviors:
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v8,01/17] fs: Move file_kattr initialization to callers
    (no matching commit)
  - [f2fs-dev,v8,02/17] fs: Add case sensitivity flags to file_kattr
    https://git.kernel.org/jaegeuk/f2fs/c/3035e4454142
  - [f2fs-dev,v8,03/17] fat: Implement fileattr_get for case sensitivity
    (no matching commit)
  - [f2fs-dev,v8,04/17] exfat: Implement fileattr_get for case sensitivity
    (no matching commit)
  - [f2fs-dev,v8,05/17] ntfs3: Implement fileattr_get for case sensitivity
    (no matching commit)
  - [f2fs-dev,v8,06/17] hfs: Implement fileattr_get for case sensitivity
    (no matching commit)
  - [f2fs-dev,v8,07/17] hfsplus: Report case sensitivity in fileattr_get
    (no matching commit)
  - [f2fs-dev,v8,08/17] ext4: Report case sensitivity in fileattr_get
    (no matching commit)
  - [f2fs-dev,v8,09/17] xfs: Report case sensitivity in fileattr_get
    (no matching commit)
  - [f2fs-dev,v8,10/17] cifs: Implement fileattr_get for case sensitivity
    (no matching commit)
  - [f2fs-dev,v8,11/17] nfs: Implement fileattr_get for case sensitivity
    (no matching commit)
  - [f2fs-dev,v8,12/17] f2fs: Add case sensitivity reporting to fileattr_get
    (no matching commit)
  - [f2fs-dev,v8,13/17] vboxsf: Implement fileattr_get for case sensitivity
    (no matching commit)
  - [f2fs-dev,v8,14/17] isofs: Implement fileattr_get for case sensitivity
    (no matching commit)
  - [f2fs-dev,v8,15/17] nfsd: Report export case-folding via NFSv3 PATHCONF
    (no matching commit)
  - [f2fs-dev,v8,16/17] nfsd: Implement NFSv4 FATTR4_CASE_INSENSITIVE and FATTR4_CASE_PRESERVING
    (no matching commit)
  - [f2fs-dev,v8,17/17] ksmbd: Report filesystem case sensitivity via FS_ATTRIBUTE_INFORMATION
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
