Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GASTCuFtoGk3jgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 16:59:29 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 681FB1A9562
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 16:59:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjxQZp0HDXaOPyX69Spuplktc/tBoPCjOax2PkHBjrI=; b=Wv0ElKplNaye5Vgd32rO0WDaCZ
	C1c23glfhuSLVdgtWkSljLGf9mXDB8kpGWQRdQfLw/+8PHSB/pRDjugWh/FEnq4Z6S2iEr4tzq64s
	3abylJFKaQ2ABJFk13byFEH1ed66QkN9tLeuH9zMqdVxy4jsIT2Y997jw9EWzmsXlgMc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvdlp-0000UI-SE;
	Thu, 26 Feb 2026 15:59:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vvdln-0000Ts-Eg;
 Thu, 26 Feb 2026 15:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9HBs/W2OsHvbC4szBpYqwLx4PHsJY1fChLiM73vzfEM=; b=mI1oc8yMl0FH4RlmUTTNOJ5DJR
 ox/klK/mdZacK3hBhPdci5T6Y6oQC2jIm6rHTdUnY7eE8kZNOqho08zZ0H/ABQyOujpjVV5nVGooa
 vCbFrGVwpdFqyhNMua3KHClMHCqHvGxABorshpbMyZJInhrXekxj+XHl0w9HTwDCy5Mg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9HBs/W2OsHvbC4szBpYqwLx4PHsJY1fChLiM73vzfEM=; b=PL4OpX6L2KgcKKT1+rdiB7fMRY
 dkelL2rzNwD64efUT5M03YghGXbJbEcTXcbaNgq0tta0xOsKa0KqP3eaXOQa/RntcFTaAxjN7DDfn
 T9Tly0+DUAdrp5wwJeM/X8qKICeGU1j3qr7FLScPl3F7C+7Q0M/oW9k9hMVBed31mSVI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvdlm-00052W-TT; Thu, 26 Feb 2026 15:59:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8568B44329;
 Thu, 26 Feb 2026 15:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21497C2BCB2;
 Thu, 26 Feb 2026 15:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772121553;
 bh=/dIyAeV0SWp+d5wV41a2YQTvW0T+tDEAvSeW39MxQrw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ghaIMgZ0Kc9sSFxLqN3M3k3TK+60uJC0pPBBx9i2Lxpt0oo/B72RlYrHZ5doKyEj4
 p/nyNLpPDIidxOkEnm7U3/35E11ov0+Rb0jIejiEJmkHCz0aVwJZRyvIN1zXco/Yjz
 d6H2cjgr2HTg0vooB26P2lu8M8somfn6uC4kg8yaF3AKM7eZGMimt73uTMiqXnPm0N
 yhIX1ErPK7xbvUpa2Y3UR81NlDwbK+tc3MCOm3fD704u1tguf4hCtEdOipJWTvG+90
 W0dnZ3lqQTX5vShOId2hTZvCGE6hOF7cSapC3LXaJJboq6djJCIAwfUZQXky+bBZKX
 KEYsgUDdZmazA==
Date: Thu, 26 Feb 2026 10:55:16 -0500
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-14-ccceff366db9@kernel.org>
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
In-Reply-To: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dan Williams <dan.j.williams@intel.com>, 
 Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>, 
 "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, 
 Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, 
 David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
 Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, 
 Bharath SM <bharathsm@microsoft.com>, 
 Alexander Aring <alex.aring@gmail.com>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, 
 Ian Kent <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, 
 Salah Triki <salah.triki@gmail.com>, 
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
 Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, 
 Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, 
 Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Yangtao Li <frank.li@vivo.com>, 
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, 
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, 
 Dave Kleikamp <shaggy@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, 
 Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, 
 John Johansen <john.johansen@canonical.com>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, 
 Roberto Sassu <roberto.sassu@huawei.com>, 
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
 Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Casey Schaufler <casey@schaufler-ca.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, 
 Martin Schiller <ms@dev.tdt.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=/dIyAeV0SWp+d5wV41a2YQTvW0T+tDEAvSeW39MxQrw=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0HEnCSKK/SHb3sYW/c+eUblqdBA7d53olyL
 4HBWYDiVJmJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtBwAKCRAADmhBGVaC
 FZpYEACU6I0oc4IB+ERKTJODeo5sUbUQRcurbkTkmeBdHU+MAD5YdiZ6z83x8OfcmpXWliPk5Ya
 u7AmLMTAsggh98Rh4QxIO+fwJLpw4ZIK1sEPEhfrzx2Mgoa9MXxpfxwLrHMTDktm0UmImLGKuIf
 yIsqBYSeqK50NLbrZmGWoz6GnXH2YyhrZboFMWnt3vm2eKyCA2IfY5cpb8RmBEzOhc2MIYSUKJp
 c1vDjKmB5HdCEbItlJxl0T+SLOrSQSDwqM2tt75fI2d0FL4k36/L5myAi/kfDy85B/w7xVV6VpB
 EPgaEOCOTjEOfCNsZ3dMpzRZ1OxTuEfuYWvqD/qrQYx30qYjjv2BTr6x8/8i0AjFF2MxCT6cMUF
 JEtme2MWU9XZ6fOnYlbsXvScqGY89Xrq0gULrm//VGWgzKBiZRLR9JDj+rpklL65JZvEyXG9ODI
 v2DH1wdJq7wy+QuXfNJrHleTpkA1Efl7+FFi1OBwkJVrdFEKMDxkFUDYJlRUXEFaZqcaBZZwazU
 QjNwVDsgfKk44TmlVoSyAOa9vYw/0LYojdfN8/k6ojhYSAyaCwmTTWi8n7vY7cgmuqoJXf+DuEV
 bTHCuOqlSQp/scKU84C72kyiBfqs3OKPxgoG0kfTlDICkZK3DbX/LfyRxd4grRdimZjMkLQgkOf
 Qzu15dS5Cp6Qypw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Now that i_ino is u64, cifs_uniqueid_to_ino_t() is a trivial
 identity function. Remove it and use fattr->cf_uniqueid directly at both
 call sites. Also remove the now-unused #include <linux/hash.h>, which was
 only needed for the old XOR-folding logic. 
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
X-Headers-End: 1vvdlm-00052W-TT
Subject: [f2fs-dev] [PATCH 14/61] smb: remove cifs_uniqueid_to_ino_t()
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
From: Jeff Layton via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jeff Layton <jlayton@kernel.org>
Cc: nvdimm@lists.linux.dev, jfs-discussion@lists.sourceforge.net,
 Jeff Layton <jlayton@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-x25@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 codalist@coda.cs.cmu.edu, linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-trace-kernel@vger.kernel.org, ecryptfs@vger.kernel.org,
 selinux@vger.kernel.org, autofs@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 ocfs2-devel@lists.linux.dev, linux-fscrypt@vger.kernel.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-xfs@vger.kernel.org, fsverity@lists.linux.dev, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, v9fs@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 linux-integrity@vger.kernel.org, ntfs3@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,goodmis.org,efficios.com,intel.com,infradead.org,mit.edu,linux.dev,suse.de,redhat.com,manguebit.org,dilger.ca,suse.com,oracle.com,brown.name,talpey.com,samba.org,gmail.com,microsoft.com,dubeyko.com,ionkov.net,codewreck.org,crudebyte.com,auristor.com,themaw.net,cs.cmu.edu,fluxnic.net,tyhicks.com,physik.fu-berlin.de,vivo.com,artax.karlin.mff.cuni.cz,nod.at,paragon-software.com,fasheh.com,evilplan.org,linux.alibaba.com,omnibond.com,szeredi.hu,alarsen.net,huawei.com,wdc.com,canonical.com,paul-moore.com,namei.org,hallyn.com,linux.ibm.com,schaufler-ca.com,amd.com,ffwll.ch,linaro.org,google.com,davemloft.net,arm.com,linux.intel.com,dev.tdt.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[146];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[jlayton@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 681FB1A9562
X-Rspamd-Action: no action

Now that i_ino is u64, cifs_uniqueid_to_ino_t() is a trivial identity
function. Remove it and use fattr->cf_uniqueid directly at both call
sites.

Also remove the now-unused #include <linux/hash.h>, which was only
needed for the old XOR-folding logic.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/smb/client/cifsfs.h  | 11 -----------
 fs/smb/client/inode.c   |  2 +-
 fs/smb/client/readdir.c |  2 +-
 3 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/fs/smb/client/cifsfs.h b/fs/smb/client/cifsfs.h
index 4a1f18022c711a7ff5b141d08ec6cac8483a6b6a..f71b490b548c0274f314dd0dc76bf570ee3cfd09 100644
--- a/fs/smb/client/cifsfs.h
+++ b/fs/smb/client/cifsfs.h
@@ -9,19 +9,8 @@
 #ifndef _CIFSFS_H
 #define _CIFSFS_H
 
-#include <linux/hash.h>
-
 #define ROOT_I 2
 
-/*
- * With i_ino being u64, we can store the full 64-bit uniqueid directly.
- */
-static inline u64
-cifs_uniqueid_to_ino_t(u64 fileid)
-{
-	return fileid;
-}
-
 static inline void cifs_set_time(struct dentry *dentry, unsigned long time)
 {
 	dentry->d_fsdata = (void *) time;
diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
index 102e7615b658726551e9b01ba25065d1f0c505ac..a82f4fbf8146572e522080bcd7df41153403978d 100644
--- a/fs/smb/client/inode.c
+++ b/fs/smb/client/inode.c
@@ -1618,7 +1618,7 @@ cifs_iget(struct super_block *sb, struct cifs_fattr *fattr)
 	cifs_dbg(FYI, "looking for uniqueid=%llu\n", fattr->cf_uniqueid);
 
 	/* With u64 i_ino, we can use the full uniqueid */
-	hash = cifs_uniqueid_to_ino_t(fattr->cf_uniqueid);
+	hash = fattr->cf_uniqueid;
 
 	inode = iget5_locked(sb, hash, cifs_find_inode, cifs_init_inode, fattr);
 	if (inode) {
diff --git a/fs/smb/client/readdir.c b/fs/smb/client/readdir.c
index 8615a8747b7f0127a781b9b3795535df4c9b73cd..cec74bd2e2302c3baeba8d7e1348ba5114d4b1e4 100644
--- a/fs/smb/client/readdir.c
+++ b/fs/smb/client/readdir.c
@@ -919,7 +919,7 @@ static bool cifs_dir_emit(struct dir_context *ctx,
 {
 	size_t delta_bytes = 0;
 	bool rc, added = false;
-	ino_t ino = cifs_uniqueid_to_ino_t(fattr->cf_uniqueid);
+	ino_t ino = fattr->cf_uniqueid;
 
 	rc = dir_emit(ctx, name, namelen, ino, fattr->cf_dtype);
 	if (!rc)

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
