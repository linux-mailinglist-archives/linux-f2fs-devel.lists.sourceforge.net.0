Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lW5sLXMI9mlORwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 02 May 2026 16:21:39 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB25C4B2506
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 02 May 2026 16:21:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:MIME-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vBFsIQHlBm1iW5qK+AtHmmzxas1ykB1KELJmPPOIz5U=; b=iMC9G/dZZ76c0If+ztMkYnN46W
	xX2oB3qbYoRW1bZBqBtJ2xJLEuDF1DPyT2IDp2OQGIM7hR2ukCCmP/Rhlnpx/iAsL3qPWUh0JZcvM
	+528+FVZOvTATt0zduC8+73CG3N9stXjA7C6742M0JjOykqLIhoPeHNA4XaE0V5I8S7U=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wJBDk-0003cX-64;
	Sat, 02 May 2026 14:21:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wJBDh-0003cQ-W8
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 May 2026 14:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7WITeB+Qm+9NdTXR9ftykQvICA3HTWab+kIb8wy4kUA=; b=Rro9gimIHmiZcuq+kV4SregIhw
 LAo+75WNAQzfrGwCc0VE4QrKjqvkBdD6khCUJIvO/yDIhIMT8gqrgFNqORFma1Wx9NKN+hhCVLbIV
 zjBXlx+/DlCeo9BUO/1CG+f48iLokxGrLhhCleOrsczxfefXWORXXPCIkGvfPFWcRyQ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7WITeB+Qm+9NdTXR9ftykQvICA3HTWab+kIb8wy4kUA=; b=O
 LIcmdmwT7laTqGm2FLKQ0OQraX6xbAZozUed2F+P/Ed7s3gSNkwoQvM9o1U6LrorhUhpL0Uqp0NuB
 0uA86jY1i+IzuBw1014TaCx9lfwQIMFECzGkjGOOdLiT4y3Pc57KqppEAbuSJscEvZImanTprPfnW
 Qw3Z3+5iVLeSUyjQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wJBDe-0000rN-EK for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 May 2026 14:21:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0745540B57;
 Sat,  2 May 2026 14:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C86C19425;
 Sat,  2 May 2026 14:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777731671;
 bh=S8uXYzoY0/m42R5BMCcNDvtfUd9F8GUKvIduB+tGh50=;
 h=From:Subject:Date:To:Cc:From;
 b=T0OplOmM9zbebhox/z03dEvqatD2rPvsRfoOb9fg60pWEuY8I0X1czPc1xuA8Kf6h
 VqF7q/nHrvm/bZU8ISq6v0oy4X+w3bXrEz4ouewV6B+AVltx3D8UB2UKaOZV5QZi3b
 07FxXLEhk2xXPek427XW3nDe6uBe94ux20g7+wrk1/+MPJfOIHwf0cop643dmrJrtq
 W49HIt3WSyqenbsPGsgDMzk3bHuad0mFqJnIeGOMZKmKr9DT7TdVw7DiXSIQ2pbi4w
 4G8Jzg+jSusCacMZsGOwDJQ/wcn4R3g5mWbY8uddhU5R1QLeJQzm/mahTm+Us52uXO
 e6bNRKaNjiXGA==
Date: Sat, 02 May 2026 10:20:45 -0400
Message-Id: <20260502-case-sensitivity-v13-0-aa853140311f@oracle.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD0I9mkC/33PzU7EIBAH8FfZcJYK09IPT76H8QDDYDG7xUAlb
 jZ9d2G91Nh4mMNMZn75z40lip4SezrdWKTskw9LaWT7cGI46+WNuLdlwEBALzoAjjoRT7Qkv/r
 s1ytXaJzD0UmlRlbOPiI5/3U3X15/+vRp3gnX6tQNUwkT9YJzHWWXHkvxoYGm6i6cbV2bfVpDv
 N6z5aly/6TIExfckIAWUQyC4DlEjWdqMFxYjZGl2BPtASFFMbAdle2HTvfo/hpyb3RHhiyGJdX
 LyZC1+sCAvTEdGVCMUahBQmuoPPXL2LbtG3dYE3a3AQAA
X-Change-ID: 20260422-case-sensitivity-5cbffc8f1558
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=10570;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=S8uXYzoY0/m42R5BMCcNDvtfUd9F8GUKvIduB+tGh50=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp9ghEvWWhuY9tqVLXhDuamT3jpHUCT3lUvVRIb
 7JfS0uP7eiJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCafYIRAAKCRAzarMzb2Z/
 l3HQD/kBFn78Xr0tZyj5Ds83UBW6IDE/NpNh3EZWcpMwWddk8aPxeP/7LJd2viCy7QrHv81II2K
 ON90v44o5x8QSAGoWOV5PiZRVwnrIXUkVRff7XSAcgt5iT+Z6bvYvJJXhDgSmVb0I/ugIzrsiye
 Ia+GRzZwGc85Hosnv+4e8qso7+DodKzaYI1Aw03Mu1vLAw7mLkF+ASzXpdSdyAZvCLsOkGYwQoj
 0qU1/0h0yAKjMGzXEl0Ncr6pNNkbq3pm1dL62eS9VPxbVlzAg51rbHnXbcsqpjNQzoAk/ARSLQT
 JqFWVGVzI+PXhyeEt9tA9XRj14Ln5nFpNvYuG0cbUdRAkhy1fQ7aqEMRtVo1bOq8DcveAVCDjse
 9uaadeBmv4wBLugxr4puEMwf76bSnkQW5wg70d9N1yKPPIPKfQM9om0HJebAge+toz/hCHgxHw+
 BhgWyNeBMvmyI6eBIkRZ3L2DkPUkrOR5DfSgrnaxc5YMYSyI/JBUQXcEYtXIAHs+vEELMXTLb9l
 SUn1KnEQB2kBpplKSCDpox6FBHGXQQrwKGnY1knvJpDx+LrdlN5qzuQf/lIOrbNCc7J8Nc6LR11
 KD3BlY6LvU/dAZfQJbExgwfNqgFGF18i+CEZPO6tNqr0duGuJgOPchvjxjr3OHuz6nGNFRKDB1v
 F4gwq/WzrCu6hYQ==
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
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wJBDe-0000rN-EK
Subject: [f2fs-dev] [PATCH v13 00/15] Exposing case folding behavior
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
X-Rspamd-Queue-Id: DB25C4B2506
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns]

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
Changes since v12:
- Address findings from sashiko (gemini-3.1):
  - cifs: Restrict case-handling flags to directories per UAPI
  - nfs: Clear case caps before PATHCONF so a failed reply
    does not retain stale bits from the prior probe
  - nfsd: Document the parent-resolution corner cases of
    nfsd_get_case_info() (single-file exports, disconnected
    dentries, hardlinks) in the v3 and v4 commit messages

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
 fs/nfs/client.c                | 21 ++++++++----
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
 fs/smb/client/cifsfs.c         | 53 +++++++++++++++++++++++++++++++
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
 47 files changed, 522 insertions(+), 49 deletions(-)
---
base-commit: 6596a02b207886e9e00bb0161c7fd59fea53c081
change-id: 20260422-case-sensitivity-5cbffc8f1558

Best regards,
--  
Chuck Lever <chuck.lever@oracle.com>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
