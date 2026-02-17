Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AMgG0zalGlyIQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Feb 2026 22:14:52 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA2E1509C8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Feb 2026 22:14:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRyENaG/I7rTr9YS10rGHj+J6VUuiXjwQU3c/I3gsNY=; b=Q52ja7RxOY5FBAKKxY8m9p445F
	XHtpWEm8XbTgpVrSgdP/I3ta++4YJsIet53VNXnfBsYmJPa9NygjmHyTXHxC8ksn8dfOkSafZJT3Q
	eJWZmAVFwdSOidS6OgagKDkpKURuQZr3WBe8dRq42wxc/cH2XnhVx4GKYiaQQMRV4glM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vsSPC-0007xg-NN;
	Tue, 17 Feb 2026 21:14:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vsSPB-0007xa-6R
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Feb 2026 21:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/QAFZrzsR3b01tUvyixH463bVn8gaQeXSmMleluN4G8=; b=TWWU4bxz7isWeUhVjnYEFFWqbJ
 d/E3HzeLDL7d1KG3JJcg+NraqKG2F+E+6dpO173HmhgfZ6qm4DVYnoFpHrpeX1Iag+aJLHtZxc9yu
 FahXr8+kUlgfuT3H66dWftVG6KPkVGpE5iNgwOC4bwmwx1sr95HVaJjSfQGPt8tjC0vU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/QAFZrzsR3b01tUvyixH463bVn8gaQeXSmMleluN4G8=; b=jpR/Sw9/ej/HYoxifbnvXwUL+h
 t6DXWNkuHwmSEDptdN/fPTBcFXjLTcvMcHotQ50l0L3XS6utuX5wZeTqe03ggnhXrck+Lynv4o6NK
 49PpwGPVPgYCzMIlJ9w4SHDTkIUXbPm8UiqT/mqqZexkiQ1pgZNK5haDfkfAcgaaJIjc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vsSPA-0001TO-FE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Feb 2026 21:14:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 305A643B44;
 Tue, 17 Feb 2026 21:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0DCC19425;
 Tue, 17 Feb 2026 21:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771362878;
 bh=SWr3Pg6zIeu2S3Z6UDsk8BzZU6tf527GPJ41POMlghM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=qME5lVPCgbs75GtVkYDVSedStUuy5Pu7iKCY4IKu3xqN3EcQE+Oh5yA77hoZy7VyU
 +0wZZYMpZQVXM9oVuFBmRCNz9ULENuT2B5em0ouDg88Yb0OXaPujVB/GBPkgNNMpHr
 EhgPO+uLpu1WI515RTCnoSYcSuoUoWHPdRcl280BUTS4HjHiimnSyoFiD+9+NmEu7s
 4m0WVXB/a1C6i48qotqtPrvf49sFdMixg5MNCldkNycO7JhTW+IJtnP0WEfZw+8dYi
 1uYBY6iDz7huxRyc2w6LATusfRgMkVW0RAKYcp9Uufer3E7jADONKO2Apo8cM0wFiU
 pB1OIFY+N5Jzg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 0B1123806667; Tue, 17 Feb 2026 21:14:31 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177136286957.643511.1991968143318289235.git-patchwork-notify@kernel.org>
Date: Tue, 17 Feb 2026 21:14:29 +0000
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
In-Reply-To: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Christian Brauner <brauner@kernel.org>: On Thu, 08 Jan 2026 12:12:55 -0500
 you wrote: > Yesterday, I sent patches to fix how directory delegation support
 is > handled on filesystems where the should be disabled [1]. That set is
 > appropriat [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vsSPA-0001TO-FE
Subject: Re: [f2fs-dev] [PATCH 00/24] vfs: require filesystems to explicitly
 opt-in to lease support
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
Cc: lucho@ionkov.net, shaggy@kernel.org, alex.aring@gmail.com, jack@suse.cz,
 pc@manguebit.org, linux-xfs@vger.kernel.org, dhavale@google.com,
 martin@omnibond.com, yuezhang.mo@sony.com, al@alarsen.net, amir73il@gmail.com,
 jfs-discussion@lists.sourceforge.net, linux-unionfs@vger.kernel.org,
 almaz.alexandrovich@paragon-software.com, clm@fb.com, adilger.kernel@dilger.ca,
 guochunhai@vivo.com, idryomov@gmail.com, ronniesahlberg@gmail.com,
 linux-mtd@lists.infradead.org, hubcap@omnibond.com, linux-cifs@vger.kernel.org,
 xiubli@redhat.com, zbestahu@gmail.com, miklos@szeredi.hu, richard@nod.at,
 mark@fasheh.com, linux-doc@vger.kernel.org, hughd@google.com,
 willy@infradead.org, ntfs3@lists.linux.dev, hch@infradead.org,
 joseph.qi@linux.alibaba.com, devel@lists.orangefs.org, linux-mm@kvack.org,
 slava@dubeyko.com, linux-btrfs@vger.kernel.org, xiang@kernel.org,
 linux-ext4@vger.kernel.org, salah.triki@gmail.com, cem@kernel.org,
 asmadeus@codewreck.org, sprasad@microsoft.com, linux_oss@crudebyte.com,
 linux-nfs@vger.kernel.org, tom@talpey.com, ocfs2-devel@lists.linux.dev,
 bharathsm@microsoft.com, linux-nilfs@vger.kernel.org, dsterba@suse.com,
 viro@zeniv.linux.org.uk, baolin.wang@linux.alibaba.com,
 jefflexu@linux.alibaba.com, jaegeuk@kernel.org, ceph-devel@vger.kernel.org,
 ericvh@kernel.org, konishi.ryusuke@gmail.com, hirofumi@mail.parknet.co.jp,
 agruenba@redhat.com, hansg@kernel.org, gfs2@lists.linux.dev,
 brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net, tytso@mit.edu,
 luisbg@kernel.org, nico@fluxnic.net, linux-erofs@lists.ozlabs.org,
 v9fs@lists.linux.dev, corbet@lwn.net, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linkinjeon@kernel.org, sfrench@samba.org,
 chuck.lever@oracle.com, lihongbo22@huawei.com, anna@kernel.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, phillip@squashfs.org.uk,
 akpm@linux-foundation.org, sj1557.seo@samsung.com, dwmw2@infradead.org,
 trondmy@kernel.org, jlbec@evilplan.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:jlayton@kernel.org,m:lucho@ionkov.net,m:shaggy@kernel.org,m:alex.aring@gmail.com,m:jack@suse.cz,m:pc@manguebit.org,m:linux-xfs@vger.kernel.org,m:dhavale@google.com,m:martin@omnibond.com,m:yuezhang.mo@sony.com,m:al@alarsen.net,m:amir73il@gmail.com,m:jfs-discussion@lists.sourceforge.net,m:linux-unionfs@vger.kernel.org,m:almaz.alexandrovich@paragon-software.com,m:clm@fb.com,m:adilger.kernel@dilger.ca,m:guochunhai@vivo.com,m:idryomov@gmail.com,m:ronniesahlberg@gmail.com,m:linux-mtd@lists.infradead.org,m:hubcap@omnibond.com,m:linux-cifs@vger.kernel.org,m:xiubli@redhat.com,m:zbestahu@gmail.com,m:miklos@szeredi.hu,m:richard@nod.at,m:mark@fasheh.com,m:linux-doc@vger.kernel.org,m:hughd@google.com,m:willy@infradead.org,m:ntfs3@lists.linux.dev,m:hch@infradead.org,m:joseph.qi@linux.alibaba.com,m:devel@lists.orangefs.org,m:linux-mm@kvack.org,m:slava@dubeyko.com,m:linux-btrfs@vger.kernel.org,m:xiang@kernel.org,m:linux-ext4@vger.kernel.org,m:salah.triki@gmail.com,m:cem@ke
 rnel.org,m:asmadeus@codewreck.org,m:sprasad@microsoft.com,m:linux_oss@crudebyte.com,m:linux-nfs@vger.kernel.org,m:tom@talpey.com,m:ocfs2-devel@lists.linux.dev,m:bharathsm@microsoft.com,m:linux-nilfs@vger.kernel.org,m:dsterba@suse.com,m:viro@zeniv.linux.org.uk,m:baolin.wang@linux.alibaba.com,m:jefflexu@linux.alibaba.com,m:jaegeuk@kernel.org,m:ceph-devel@vger.kernel.org,m:ericvh@kernel.org,m:konishi.ryusuke@gmail.com,m:hirofumi@mail.parknet.co.jp,m:agruenba@redhat.com,m:hansg@kernel.org,m:gfs2@lists.linux.dev,m:brauner@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:tytso@mit.edu,m:luisbg@kernel.org,m:nico@fluxnic.net,m:linux-erofs@lists.ozlabs.org,m:v9fs@lists.linux.dev,m:corbet@lwn.net,m:samba-technical@lists.samba.org,m:linux-kernel@vger.kernel.org,m:linkinjeon@kernel.org,m:sfrench@samba.org,m:chuck.lever@oracle.com,m:lihongbo22@huawei.com,m:anna@kernel.org,m:jack@suse.com,m:linux-fsdevel@vger.kernel.org,m:phillip@squashfs.org.uk,m:akpm@linux-foundation.org,m:sj1557.seo@samsu
 ng.com,m:dwmw2@infradead.org,m:trondmy@kernel.org,m:jlbec@evilplan.org,m:alexaring@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ionkov.net,kernel.org,gmail.com,suse.cz,manguebit.org,vger.kernel.org,google.com,omnibond.com,sony.com,alarsen.net,lists.sourceforge.net,paragon-software.com,fb.com,dilger.ca,vivo.com,lists.infradead.org,redhat.com,szeredi.hu,nod.at,fasheh.com,infradead.org,lists.linux.dev,linux.alibaba.com,lists.orangefs.org,kvack.org,dubeyko.com,codewreck.org,microsoft.com,crudebyte.com,talpey.com,suse.com,zeniv.linux.org.uk,mail.parknet.co.jp,mit.edu,fluxnic.net,lists.ozlabs.org,lwn.net,lists.samba.org,samba.org,oracle.com,huawei.com,squashfs.org.uk,linux-foundation.org,samsung.com,evilplan.org];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_GT_50(0.00)[85];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 0AA2E1509C8
X-Rspamd-Action: no action

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Christian Brauner <brauner@kernel.org>:

On Thu, 08 Jan 2026 12:12:55 -0500 you wrote:
> Yesterday, I sent patches to fix how directory delegation support is
> handled on filesystems where the should be disabled [1]. That set is
> appropriate for v6.19. For v7.0, I want to make lease support be more
> opt-in, rather than opt-out:
> 
> For historical reasons, when ->setlease() file_operation is set to NULL,
> the default is to use the kernel-internal lease implementation. This
> means that if you want to disable them, you need to explicitly set the
> ->setlease() file_operation to simple_nosetlease() or the equivalent.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,01/24] fs: add setlease to generic_ro_fops and read-only filesystem directory operations
    https://git.kernel.org/jaegeuk/f2fs/c/ca4388bf1d9e
  - [f2fs-dev,02/24] affs: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/663cdef61a27
  - [f2fs-dev,03/24] btrfs: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/f9688474e413
  - [f2fs-dev,04/24] erofs: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/f8902d3df893
  - [f2fs-dev,05/24] ext2: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/ccdc2e0569f5
  - [f2fs-dev,06/24] ext4: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/20747a2a29c6
  - [f2fs-dev,07/24] exfat: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/b8ca02667552
  - [f2fs-dev,08/24] f2fs: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/9e2ac6ddb397
  - [f2fs-dev,09/24] fat: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/a9acc8422ffb
  - [f2fs-dev,10/24] gfs2: add a setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/3b514c333390
  - [f2fs-dev,11/24] jffs2: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/c275e6e7c085
  - [f2fs-dev,12/24] jfs: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/7dd596bb35e5
  - [f2fs-dev,13/24] nilfs2: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/f46bb13dc5d9
  - [f2fs-dev,14/24] ntfs3: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/6aaa1d6337b5
  - [f2fs-dev,15/24] ocfs2: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/f15d3150279d
  - [f2fs-dev,16/24] orangefs: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/136b43aa4b16
  - [f2fs-dev,17/24] overlayfs: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/94a3f60af5dc
  - [f2fs-dev,18/24] squashfs: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/dfd8676efe43
  - [f2fs-dev,19/24] tmpfs: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/f5a3446be277
  - [f2fs-dev,20/24] udf: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/dbe8d57d1483
  - [f2fs-dev,21/24] ufs: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/545b4144d804
  - [f2fs-dev,22/24] xfs: add setlease file operation
    https://git.kernel.org/jaegeuk/f2fs/c/6163b5da2f5e
  - [f2fs-dev,23/24] filelock: default to returning -EINVAL when ->setlease operation is NULL
    https://git.kernel.org/jaegeuk/f2fs/c/2b10994be716
  - [f2fs-dev,24/24] fs: remove simple_nosetlease()
    https://git.kernel.org/jaegeuk/f2fs/c/51e49111c00b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
