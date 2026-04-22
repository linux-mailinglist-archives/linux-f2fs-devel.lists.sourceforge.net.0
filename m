Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHqzCB5a6WndXwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 01:30:38 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FB344B914
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 01:30:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:MIME-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LdmsQVEVm1Yp16cx3lB+YMMH35QLD3Ih0aSO4inic6k=; b=eegZJ0DjvLJXf2Y5OGS4qD6MVd
	gr3sVGF2u8WLDtIANQQxiWvCnpOwZUY6nwxMFur2I31tp5dy+s3hO5waLaHOG3cjRaOn//4Xz8ToX
	7C/ESWIDoczSg6IYnK2+a/unaDGkAqRc4unHHHeFePoHt5D8iAaSvZAPuel2Xh++zT6Q=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFh1Y-00065r-UU;
	Wed, 22 Apr 2026 23:30:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wFh1X-00065e-Kl
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Apr 2026 23:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VNDioApq7lat64gwIT+I7nnf9oOLy49swlijzjz4Qq4=; b=klZcuvvF4ueSOQ3VeGNWIi7LUF
 XYfUZ3x7uMdBL2X2x/07Ke3JWiS4hS2hJA9d3xPo6PiqWv17wTRvg30m17cVSy8YvrCiYu35VzFly
 2n6iOa7PdQ6Nzp5ZZQ5bv/BgNV7ZNx3u79QOSWZJDeYO9twPylqCrcRWD8EVDYaeN9fw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VNDioApq7lat64gwIT+I7nnf9oOLy49swlijzjz4Qq4=; b=W
 MuxgOStWafsuqrS3o6CGQs+PSiFM7pvu+aGsr5cN30BCt/YLxuMUNzPjYBlu9tUCIaVTRNHYR0zOW
 2flWl6BmqUX0risVdWBgBWLMCSTKOjrQuk/sWCsbgVB3SWZ0O2T19WoevW5ohBWydV7vOZ8ep8HOp
 5O0kUgzQH1EIfOVM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wFh1X-0006cs-Mg for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Apr 2026 23:30:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3E66943745;
 Wed, 22 Apr 2026 23:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1496C19425;
 Wed, 22 Apr 2026 23:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776900617;
 bh=nSWvRvVLvvSZdli9CnC8hr1bXPfPcgp+ZC3UK68WE7E=;
 h=From:Subject:Date:To:Cc:From;
 b=N6+HGFyhQd9DvW78jZtWY1QbnbgcQhKYbdv/Pr4g7qkRM9M1dt3zSDjvsq8+Cj6Pq
 /fYZRkpRRSxhtTiitiM6p0xyWllr8bgvYNLbg2S1HyHzztErbjiK8wJC9x+QtQWJzG
 jbGrbNjAcP3LB5fQiQVh5B9pu1AHdqSUOw6cmWYPtwbfHS9q0GIH7T812IUuRi0Fh8
 +Trv4GBlAhj7ISIQGWim7FoG76jC1fYOG+Eiv9DUQyKg4lsQ+KLXMaKOI6ovh2t4gS
 vJODnaQhSbNkc3kC5p1owoayosmQoqWLeTZOFy3SKWxoOY5peKpHkibCTXvOefNHFs
 1hO1Xuq4ZpY4g==
Date: Wed, 22 Apr 2026 19:29:54 -0400
Message-Id: <20260422-case-sensitivity-v9-0-be023cc070e2@oracle.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPJZ6WkC/yWMQQ7CMAwEv1L5TEqJKBS+gjgkrk2NUIriEIGq/
 p0EDnuY1e4soBSFFM7NApGyqMyhwGnTAE4u3MjIWBhsZw/d3lqDTskoBZUkWdLH9OiZceBd3w9
 Qbs9ILO+f8nL9s778nTBVT134qvDRBZxqlVm3JebY2rbaeX6MsK5f7o3QmpsAAAA=
X-Change-ID: 20260422-case-sensitivity-5cbffc8f1558
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6855;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=nSWvRvVLvvSZdli9CnC8hr1bXPfPcgp+ZC3UK68WE7E=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp6Vn9Kt1tzr2kFvP0Kdpok68GcrcKfLlwgFtsM
 oazIO8Ul9SJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCaelZ/QAKCRAzarMzb2Z/
 l9QQD/0cnxc2xWUgbGlmzr0CatU2yPuq86+5240DgMd1JmcaJt9CAna3J70eXcj3QgfuPQKTKRV
 6Wj4NTvZq48eV9gFyX4EIbWUzlkuQdgMaxxQZeq/avJeilSwdxJqsg/CQx6VEevXvlW2bCEiWpy
 GK4Scn4yMuj5Wu04CyGzjvh8ySvjSmjJjCwzeSiT4rI5hUIFNmVXu7ywVgMmVemz7TVVXZjErFP
 +xFdr4I9IcMOJVA6scAtzMnFO7vFs40YtiVPkSfCQYle/w3k0FKqpGEMVueH75kl/Jaaxn8wkzv
 W1lY/B9IqCTW4NdG6Qd4ZaaCr+wnHwNxgzuYXfBqRWt/uYrCs1SH554zHYsStczLnFEAEg0y2P7
 Ck6/isIXfTB5tYlVfBL44MRKfNDDhtyZoqfzhgqnqzBtNNIk+GZouAD4qqjWYlWCoTNC242b9IN
 713gzqezLN8ax2i1d1cUKZCcXz2e6V4a6Th1VxD1u15I918Ba0wQXowjwKf/CmCj0e5A2VmqP+N
 k75pCnONxAWYNGk545R71I+qwLpexoxkyKhnn+u3VQlVk1djoK6aQ8xA+K9njqvvUb4drZVPULh
 w9BWIIwK9SgO06IGf9WwP4tf/SXkjGH1YnzYzcmMfWlONfvUoalk1OQnGZd1hBhwVs79ZFG+6YD
 WNaMOCAe6Hb566Q==
X-Developer-Key: i=chuck.lever@oracle.com; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Following on from
 https://lore.kernel.org/linux-nfs/20251021-zypressen-bazillus-545a44af57fd@brauner/T/#m0ba197d75b7921d994cf284f3cef3a62abb11aaa
 I'm attempting to implement enough support in the Linux VFS to enable file
 services like NFSD and ksmbd (and user space equivalents) to provide the
 actual status of case folding support in local file [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wFh1X-0006cs-Mg
Subject: [f2fs-dev] [PATCH v9 00/17] Exposing case folding behavior
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
From: Chuck Lever via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chuck Lever <cel@kernel.org>
Cc: pc@manguebit.org, yuezhang.mo@sony.com, cem@kernel.org,
 almaz.alexandrovich@paragon-software.com, adilger.kernel@dilger.ca,
 linux-cifs@vger.kernel.org, sfrench@samba.org, slava@dubeyko.com,
 "Darrick J. Wong" <djwong@kernel.org>, linux-ext4@vger.kernel.org,
 linkinjeon@kernel.org, sprasad@microsoft.com, frank.li@vivo.com,
 ronniesahlberg@gmail.com, glaubitz@physik.fu-berlin.de, jaegeuk@kernel.org,
 hirofumi@mail.parknet.co.jp, linux-nfs@vger.kernel.org, tytso@mit.edu,
 linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org,
 Chuck Lever <chuck.lever@oracle.com>, hansg@kernel.org, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:djwong@kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:linux-nfs@vger.kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[manguebit.org,sony.com,kernel.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
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
	HAS_REPLYTO(0.00)[cel@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,oracle.com:mid]
X-Rspamd-Queue-Id: A5FB344B914
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Following on from

https://lore.kernel.org/linux-nfs/20251021-zypressen-bazillus-545a44af57fd@brauner/T/#m0ba197d75b7921d994cf284f3cef3a62abb11aaa

I'm attempting to implement enough support in the Linux VFS to
enable file services like NFSD and ksmbd (and user space
equivalents) to provide the actual status of case folding support
in local file systems. The default behavior for local file systems
not explicitly supported in this series is to reflect the usual
POSIX behaviors:

  case-insensitive = false
  case-nonpreserving = false

The case-insensitivity and case-nonpreserving booleans can be
consumed immediately by NFSD. These two attributes have been part of
the NFSv3 and NFSv4 protocols for decades, in order to support NFS
client implementations on non-POSIX systems.

Support for user space file servers is why this series exposes case
folding information via a user-space API. I don't know of any other
category of user-space application that requires access to case
folding info.

The Linux NFS community has a growing interest in supporting NFS
clients on Windows and MacOS platforms, where file name behavior does
not align with traditional POSIX semantics.

One example of a Windows-based NFS client is [1]. This client
implementation explicitly requires servers to report
FATTR4_WORD0_CASE_INSENSITIVE = TRUE for proper operation, a hard
requirement for Windows client interoperability because Windows
applications expect case-insensitive behavior. When an NFS client
knows the server is case-insensitive, it can avoid issuing multiple
LOOKUP/READDIR requests to search for case variants, and applications
like Win32 programs work correctly without manual workarounds or
code changes.

Even the Linux client can take advantage of this information. Trond
merged patches 4 years ago [2] that introduce support for case
insensitivity, in support of the Hammerspace NFS server. In
particular, when a client detects a case-insensitive NFS share,
negative dentry caching must be disabled (a lookup for "FILE.TXT"
failing shouldn't cache a negative entry when "file.txt" exists)
and directory change invalidation must clear all cached case-folded
file name variants.

Hammerspace servers and several other NFS server implementations
operate in multi-protocol environments, where a single file service
instance caters to both NFS and SMB clients. In those cases, things
work more smoothly for everyone when the NFS client can see and adapt
to the case folding behavior that SMB users rely on and expect. NFSD
needs to support the case-insensitivity and case-nonpreserving
booleans properly in order to participate as a first-class citizen
in such environments.

[1] https://github.com/kofemann/ms-nfs41-client

[2] https://patchwork.kernel.org/project/linux-nfs/cover/20211217203658.439352-1-trondmy@kernel.org/

---
Changes since v8:
- Rebase on v7.0-rc1

Changes since v7:
- Split file_attr initialization changes into a separate patch

Changes since v6:
- Remove the memset from vfs_fileattr_get

Changes since v5:
- Finish the conversion to FS_XFLAGs
- NFSv4 GETATTR now clears the attr mask bit if nfsd_get_case_info()
  fails

Changes since v4:
- Observe the MSDOS "nocase" mount option
- Define new FS_XFLAGs for the user API

Changes since v3:
- Change fa->case_preserving to fa_case_nonpreserving
- VFAT is case preserving
- Make new fields available to user space

Changes since v2:
- Remove unicode labels
- Replace vfs_get_case_info
- Add support for several more local file system implementations
- Add support for in-kernel SMB server

Changes since RFC:
- Use file_getattr instead of statx
- Postpone exposing Unicode version until later
- Support NTFS and ext4 in addition to FAT
- Support NFSv4 fattr4 in addition to NFSv3 PATHCONF

---
Chuck Lever (17):
      fs: Move file_kattr initialization to callers
      fs: Add case sensitivity flags to file_kattr
      fat: Implement fileattr_get for case sensitivity
      exfat: Implement fileattr_get for case sensitivity
      ntfs3: Implement fileattr_get for case sensitivity
      hfs: Implement fileattr_get for case sensitivity
      hfsplus: Report case sensitivity in fileattr_get
      ext4: Report case sensitivity in fileattr_get
      xfs: Report case sensitivity in fileattr_get
      cifs: Implement fileattr_get for case sensitivity
      nfs: Implement fileattr_get for case sensitivity
      f2fs: Add case sensitivity reporting to fileattr_get
      vboxsf: Implement fileattr_get for case sensitivity
      isofs: Implement fileattr_get for case sensitivity
      nfsd: Report export case-folding via NFSv3 PATHCONF
      nfsd: Implement NFSv4 FATTR4_CASE_INSENSITIVE and FATTR4_CASE_PRESERVING
      ksmbd: Report filesystem case sensitivity via FS_ATTRIBUTE_INFORMATION

 fs/exfat/exfat_fs.h      |  2 ++
 fs/exfat/file.c          | 17 +++++++++++++++--
 fs/exfat/namei.c         |  1 +
 fs/ext4/ioctl.c          |  7 +++++++
 fs/f2fs/file.c           |  8 ++++++++
 fs/fat/fat.h             |  3 +++
 fs/fat/file.c            | 23 +++++++++++++++++++++++
 fs/fat/namei_msdos.c     |  1 +
 fs/fat/namei_vfat.c      |  1 +
 fs/file_attr.c           | 16 ++++++++--------
 fs/hfs/dir.c             |  1 +
 fs/hfs/hfs_fs.h          |  2 ++
 fs/hfs/inode.c           | 13 +++++++++++++
 fs/hfsplus/inode.c       | 10 ++++++++++
 fs/isofs/dir.c           | 11 +++++++++++
 fs/nfs/client.c          |  9 +++++++--
 fs/nfs/inode.c           | 21 +++++++++++++++++++++
 fs/nfs/internal.h        |  3 +++
 fs/nfs/nfs3proc.c        |  2 ++
 fs/nfs/nfs3xdr.c         |  7 +++++--
 fs/nfs/nfs4proc.c        |  2 ++
 fs/nfs/proc.c            |  3 +++
 fs/nfs/symlink.c         |  3 +++
 fs/nfsd/nfs3proc.c       | 18 ++++++++++--------
 fs/nfsd/nfs4xdr.c        | 25 +++++++++++++++++++++++--
 fs/nfsd/vfs.c            | 29 +++++++++++++++++++++++++++++
 fs/nfsd/vfs.h            |  3 +++
 fs/ntfs3/file.c          | 23 +++++++++++++++++++++++
 fs/ntfs3/inode.c         |  1 +
 fs/ntfs3/namei.c         |  2 ++
 fs/ntfs3/ntfs_fs.h       |  1 +
 fs/smb/client/cifsfs.c   | 20 ++++++++++++++++++++
 fs/smb/server/smb2pdu.c  | 25 +++++++++++++++++++------
 fs/vboxsf/dir.c          |  1 +
 fs/vboxsf/file.c         |  6 ++++--
 fs/vboxsf/super.c        |  7 +++++++
 fs/vboxsf/utils.c        | 26 ++++++++++++++++++++++++++
 fs/vboxsf/vfsmod.h       |  6 ++++++
 fs/xfs/xfs_ioctl.c       |  9 ++++++++-
 include/linux/fileattr.h |  3 ++-
 include/linux/nfs_xdr.h  |  2 ++
 include/uapi/linux/fs.h  |  7 +++++++
 42 files changed, 346 insertions(+), 34 deletions(-)
---
base-commit: 6596a02b207886e9e00bb0161c7fd59fea53c081
change-id: 20260422-case-sensitivity-5cbffc8f1558

Best regards,
--  
Chuck Lever



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
