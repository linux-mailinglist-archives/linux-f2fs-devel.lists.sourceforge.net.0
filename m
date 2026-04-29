Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNNPI/ZI8mnDpQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2026 20:07:50 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4DC4989A2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2026 20:07:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:MIME-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lsQg+K1CamsXsm+tn5xiYQ3OlkCyG4tHjG0+5lLPJQY=; b=R4dYwvzd5oiSdneB90GbKupBBt
	0d7ZGxYwa+2Y/ySt0boM4NLP9t7fLwjevrOmRhD9AgTAJQAmnY7wXS1/5tt/jCXvXToq7BRBUs9Ad
	1ufx+6Hc7MeKk1tqZJcfgshGNJ/WG9JrzZb819+ZKyRDqIFq71afcQAN7CKEEgBStbeY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wI9K1-0005Er-0Q;
	Wed, 29 Apr 2026 18:07:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wI9Jz-0005Ee-MT
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Apr 2026 18:07:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NWKuf9Hq61FpbLAPAiPAnz8KOyMCnSTyJimhRPX2brg=; b=Eza5rmfvIi9yUAFs3rOFNpe9+q
 6+QGLFlI887R6hkhNkhfHDSOliMhPS6G3ZEO5LsxjfiLQuauwdH4+C4sec63m/OmzeOP9fmYXTDLw
 5ANvMQfxZMOXrnVIp4152Pg7pJW9biJOxuEUbpE6UOVs/Zh6hg4djY3J1rq/idBpjx5s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NWKuf9Hq61FpbLAPAiPAnz8KOyMCnSTyJimhRPX2brg=; b=B
 ZLR2xFFN84Fd8rY9i/ytOdNJ/j2gauLDMo5iTFPTXpp1L4hEsoGsJ5PN4hi55NXpq/oscmpVHhtWT
 RMlcO7JTbBUwo9O36zyc8g9VtI4wgxxN5QRH2VDY+GQiqrCWHEoPmQaBc4eRygqk2rZKM/hukURtL
 qJ8uyw54ziEjHtKc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wI9Jz-00013W-EJ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Apr 2026 18:07:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AEF656024D;
 Wed, 29 Apr 2026 18:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD87C19425;
 Wed, 29 Apr 2026 18:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777486048;
 bh=nGIAvTon0zs9b1xP0r8i5cYHOhAA/ZjGGgXeoFYtSA0=;
 h=From:Subject:Date:To:Cc:From;
 b=rbpvfHDMiWhiox01PdHgWiDajLy46O57SvBnNBUKJF5rY7CeK0XMvUpeyCnSZtD+M
 czBdnUPUXQOZ8uTgetzcOdw5qA0Jyqmrqvmm69zYx8CO/MWX4988jXwneseeqF8bjn
 XCMhT4tBKBbrBzBZdyo1qKAxI99stL20jhATDEAmstQIXnBprsZkztF8pyvQBib75J
 zIyZ/hBX6tDWqbnzD17epgB7MmmPW/apvdI7qTiqpwWXQIYur6AeEImgwRMtkhXTEc
 9CJLuov5syAnb6Sgzi0tx+YofaHT22pMRWsrlgDwL79ATA0hdKElKNIdYNYhU8HQra
 d6ImeZTBwVbkg==
Date: Wed, 29 Apr 2026 14:07:11 -0400
Message-Id: <20260429-case-sensitivity-v12-0-8057123bebe0@oracle.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAM9I8mkC/33OTW7DIBAF4KtErIsL2Pgnq96j6gKGoZ4qMRG4q
 FHkuxeSTaJGXcxiRm8+vQtLGAkT2+8uLGKmRGEpi1QvOwazWT6RkysHpoTqRacUB5OQJ1wSrZR
 pPXMN1nsYvdR6ZOXtFNHTz9V8/7jt6dt+IazVqQlbCRvNAnM9ZZ9ey/ChUU3VfTi4GpsprSGer
 93yVLl/WuSJC25RqBZADALVW4gGDthAOLJaI0txT7RPCCmKAe2oXT90pgf/15D3RvfMkMVwqHs
 5WXTOPBrbtv0CS7SfZ3MBAAA=
X-Change-ID: 20260422-case-sensitivity-5cbffc8f1558
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=10117;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=nGIAvTon0zs9b1xP0r8i5cYHOhAA/ZjGGgXeoFYtSA0=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp8kjUruCj6HSCo8h/ROV63cWR/oVu16zwqghlT
 mPK1ER4ZuWJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCafJI1AAKCRAzarMzb2Z/
 l60jD/wOFP5Liv/4++jhg7MCr4gC8zrGZH6SLe53mUycIA01Yl4fSZlymrf+2x/ZbrtzvPJsQMz
 tdRHlxlJVf7t8N03MaxrwXGis+ciyJyJhjg1WTVKRHhNdGC+eOEpX1ptetE0rU8axoVTge0c+1a
 4qjf9lDvy70V8AStRqezRJn51vNjMt14XBRWo+R6HmKVpnM0GPzEj5oPWs+Vu74/d0hNN9cV5if
 U/e/a9AnV8vm40EmwIHtrgf3DwEdM8kdPu/3seRyspTFDMLuyixZ+4YZaMyF/ruCDI0F/e9g6Rn
 GO+bAmOEvn4VLXQfEgcAO1lfzIyShSsB7uqAUhDkLaUiGNeRLZE3/oVUzcS3+AuC8ov0rEHAAhZ
 uEmvXxjJsHL1ESfV6YkxDRWu/a+WmwTwPy0xQ8LwghSSFL80RuuLk1kfW06IxH5jJYnzYMpny4g
 SX3mKds5MKYu2sO4xjkIKJA9mY9KDBBV3tRZiMZch2buj60MPlW0f7Fe4KxwSS3WN8HxSEC5OIB
 5nOiMO2L87RiuMda0PTn7Yb9iH8mEOzsX6omLFnC8m4Zm40B5xG3PlEfNsqOAM7O/nVlKUFShNZ
 kHL6rF/gMEfTqQmJIXDy/ARe6JSajQpZmtQtQrPJSaG8UnV4pgb354onxVVMYdBXi+i+eZerZL1
 DfDyZzX3FJpTM7Q==
X-Developer-Key: i=chuck.lever@oracle.com; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Following on from:
 https://lore.kernel.org/linux-nfs/20251021-zypressen-bazillus-545a44af57fd@brauner/T/#m0ba197d75b7921d994cf284f3cef3a62abb11aaa
 I'm attempting to implement enough support in the Linux VFS to enable file
 services like NFSD and ksmbd (and user space equivalents) to provide the
 actual status of case folding support in local file [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wI9Jz-00013W-EJ
Subject: [f2fs-dev] [PATCH v12 00/15] Exposing case folding behavior
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
 Roland Mainz <roland.mainz@nrubsig.org>,
 almaz.alexandrovich@paragon-software.com, adilger.kernel@dilger.ca,
 linux-cifs@vger.kernel.org, sfrench@samba.org, slava@dubeyko.com,
 "Darrick J. Wong" <djwong@kernel.org>, linux-ext4@vger.kernel.org,
 linkinjeon@kernel.org, Steve French <stfrench@microsoft.com>,
 sprasad@microsoft.com, frank.li@vivo.com, ronniesahlberg@gmail.com,
 glaubitz@physik.fu-berlin.de, jaegeuk@kernel.org, hirofumi@mail.parknet.co.jp,
 linux-nfs@vger.kernel.org, tytso@mit.edu, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, Chuck Lever <chuck.lever@oracle.com>,
 hansg@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: DB4DC4989A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:roland.mainz@nrubsig.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:djwong@kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:stfrench@microsoft.com,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:linux-nfs@vger.kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[manguebit.org,sony.com,kernel.org,nrubsig.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.813];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:mid,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns]

Following on from:

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
Changes since v11:
- isofs: Wire .fileattr_get only on directory inodes, since
  NFSD and ksmbd query casefolding on directories (Jan Kara)
- xfs, hfsplus: Drop the FS_CASEFOLD_FL fileattr_get mask;
  admit the bit through fileattr_set's allowlist instead
- Address findings from sashiko(gemini-3) and gpt-5.5:
  - cifs: Wire .fileattr_get on cifs_namespace_inode_operations
    so DFS referral / automount directories report case handling
  - fat, ntfs3: Fill FS_IMMUTABLE_FL in fileattr_get
  - hfsplus: Hide FS_CASEFOLD_FL from the legacy flags view so
    chattr round-trips do not hit the setflags whitelist
  - nfs: Clear NFS_CAP_CASE_INSENSITIVE and
    NFS_CAP_CASE_NONPRESERVING before re-OR'ing in the v3 and
    v4 probe paths so re-probe / TSM does not retain stale caps
  - nfsd: Switch nfsd_get_case_info() to errno return so
    v3 PATHCONF and v4 GETATTR can apply version-appropriate
    policy on failure
  - nfsd: Use dget_parent() in v4 case-attr probe to keep
    the parent dentry referenced across the query
  - isofs: Report FS_XFLAG_CASENONPRESERVING for map=n/map=a

Changes since v10:
- cifs: Source case-handling flags from the server's cached
  FS_ATTRIBUTE_INFORMATION reply instead of the nocase mount
  option, with a nocase fallback when the reply is absent
- Address findings from sashiko(gemini-3) and gpt-5.5:
  - nfs: Skip pathconf case bits on NFSv4 (set via FATTR4_CASE_*
    instead)
  - xfs: Hide FS_CASEFOLD_FL from the legacy flags view so
    chattr round-trips do not hit the setflags whitelist
  - ext4, f2fs: Drop redundant fileattr_get patches; the
    FS_CASEFOLD_FL translation in fileattr_fill_flags() already
    reports FS_XFLAG_CASEFOLD for casefolded directories
  - nfsd: Report FATTR4_HOMOGENEOUS = FALSE when the exported
    filesystem has a Unicode encoding, since per-directory
    casefold makes the fs-scoped case attributes inhomogeneous
  - nfsd: Document in nfsd_get_case_info() why -ENOIOCTLCMD and
    -ENOTTY are swallowed while other errors propagate
  - fat: Honor vfat 'check=strict' when reporting FS_XFLAG_CASEFOLD
  - Set FS_CASEFOLD_FL so FS_IOC_GETFLAGS reflects case-insensitive
    mount
  - isofs: Register fileattr_get on regular file and symlink inodes,
    not just directories
  - nfsd: Query NFSv4 FATTR4_CASE_* from the parent directory for
    non-directory objects, since casefold lives on the directory

Changes since v9:
- nfs: always probe PATHCONF for case caps. Default to case-
  preserving when the server does not report case_preserving
- nfsd, ksmbd: tolerate -ENOTTY from vfs_fileattr_get() so
  overlayfs exports on backing filesystems without fileattr_get
  do not fail the RPC
- xfs: map FS_XFLAG_CASEFOLD inside xfs_ip2xflags() so BULKSTAT
  and FS_IOC_FSGETXATTR report the flag consistently
- vboxsf: reject a short host reply to SHFL_INFO_VOLUME before
  trusting volinfo.properties.case_sensitive

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
Chuck Lever (15):
      fs: Move file_kattr initialization to callers
      fs: Add case sensitivity flags to file_kattr
      fat: Implement fileattr_get for case sensitivity
      exfat: Implement fileattr_get for case sensitivity
      ntfs3: Implement fileattr_get for case sensitivity
      hfs: Implement fileattr_get for case sensitivity
      hfsplus: Report case sensitivity in fileattr_get
      xfs: Report case sensitivity in fileattr_get
      cifs: Implement fileattr_get for case sensitivity
      nfs: Implement fileattr_get for case sensitivity
      vboxsf: Implement fileattr_get for case sensitivity
      isofs: Implement fileattr_get for case sensitivity
      nfsd: Report export case-folding via NFSv3 PATHCONF
      nfsd: Implement NFSv4 FATTR4_CASE_INSENSITIVE and FATTR4_CASE_PRESERVING
      ksmbd: Report filesystem case sensitivity via FS_ATTRIBUTE_INFORMATION

 fs/exfat/exfat_fs.h            |  2 ++
 fs/exfat/file.c                | 18 +++++++++--
 fs/exfat/namei.c               |  1 +
 fs/fat/fat.h                   |  3 ++
 fs/fat/file.c                  | 36 +++++++++++++++++++++
 fs/fat/namei_msdos.c           |  1 +
 fs/fat/namei_vfat.c            |  1 +
 fs/file_attr.c                 | 16 +++++-----
 fs/hfs/dir.c                   |  1 +
 fs/hfs/hfs_fs.h                |  2 ++
 fs/hfs/inode.c                 | 14 ++++++++
 fs/hfsplus/inode.c             | 16 +++++++++-
 fs/isofs/dir.c                 | 16 ++++++++++
 fs/isofs/isofs.h               |  3 ++
 fs/nfs/client.c                | 25 +++++++++++----
 fs/nfs/inode.c                 | 15 +++++++++
 fs/nfs/internal.h              |  3 ++
 fs/nfs/namespace.c             |  2 ++
 fs/nfs/nfs3proc.c              |  2 ++
 fs/nfs/nfs3xdr.c               |  7 ++--
 fs/nfs/nfs4proc.c              | 10 ++++--
 fs/nfs/proc.c                  |  3 ++
 fs/nfs/symlink.c               |  3 ++
 fs/nfsd/nfs3proc.c             | 36 ++++++++++++++++-----
 fs/nfsd/nfs4xdr.c              | 52 ++++++++++++++++++++++++++++--
 fs/nfsd/vfs.c                  | 72 ++++++++++++++++++++++++++++++++++++++++++
 fs/nfsd/vfs.h                  |  3 ++
 fs/nfsd/xdr3.h                 |  4 +--
 fs/ntfs3/file.c                | 29 +++++++++++++++++
 fs/ntfs3/inode.c               |  1 +
 fs/ntfs3/namei.c               |  2 ++
 fs/ntfs3/ntfs_fs.h             |  1 +
 fs/smb/client/cifsfs.c         | 41 ++++++++++++++++++++++++
 fs/smb/client/cifsfs.h         |  3 ++
 fs/smb/client/namespace.c      |  1 +
 fs/smb/server/smb2pdu.c        | 30 ++++++++++++++----
 fs/vboxsf/dir.c                |  1 +
 fs/vboxsf/file.c               |  6 ++--
 fs/vboxsf/super.c              |  7 ++++
 fs/vboxsf/utils.c              | 30 ++++++++++++++++++
 fs/vboxsf/vfsmod.h             |  6 ++++
 fs/xfs/libxfs/xfs_inode_util.c |  2 ++
 fs/xfs/xfs_ioctl.c             | 22 ++++++++++---
 include/linux/fileattr.h       |  3 +-
 include/linux/nfs_fs_sb.h      |  2 +-
 include/linux/nfs_xdr.h        |  2 ++
 include/uapi/linux/fs.h        |  7 ++++
 47 files changed, 513 insertions(+), 50 deletions(-)
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
