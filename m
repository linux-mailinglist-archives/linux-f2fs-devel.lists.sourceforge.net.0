Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ki3H+xuoGk3jgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:03:56 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B0D1A97DE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:03:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mrgnWc4Nq9mraFr3canGvDJ9Hu/fD17deRETGRB9GI=; b=W6YMesSDERomJOUdtrZklS/i6s
	i13kAHrCgV9yhbb2IBpMxf51KnWJTcCDKb97bRXlaH3ysnZgHQPQ0tSKw83Z6gAfuC45NKWUIGMp9
	+mfxhdOEigPE9nHRQpDarFAQLWFJirJ+zNdpEs7r7LqWRGr7ROg7BOoaQO/pGLNv0Uws=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvdq6-0002f2-Tg;
	Thu, 26 Feb 2026 16:03:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vvdq4-0002eg-A4;
 Thu, 26 Feb 2026 16:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J2ujPgExd8rNHD9CLg8cZYlsJotDN55wgwju4Cixcgk=; b=IgcHO/64DdV5NTA2Rt5Y6FuOC0
 Ye4XQOEfqY1FVH5AOCpV60fo/sKIinh/lNCPkgNrDVVFzre6NQLVTIhqpn9Ow/JN19OMd92QWaBLC
 jnMP7s0tJ4D//zY/hegHnvY62vm+LhKSvMcSWBxF2JyOM05xhvoemxtQPidPTEbYqZ1Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J2ujPgExd8rNHD9CLg8cZYlsJotDN55wgwju4Cixcgk=; b=lIbAis8vJhuI64aUd2Vi4TU5Cs
 u/pE+DWp9NNW62MOzSAHghRrrTr0oBkx1u41CyDj2Nnk4C7MNllI1OWt3jXX1mj4I+yp5xA7mMRu+
 MwBt3OWqkiRkUMpRSpPPnounbSgt47vFSnUudzjiFVP5qwbLVEGZ86oe7YUszBAlDoxY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvdpw-0005Yp-C2; Thu, 26 Feb 2026 16:03:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6476C434AC;
 Thu, 26 Feb 2026 16:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119CAC19423;
 Thu, 26 Feb 2026 16:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772121804;
 bh=1IUHG0qj9DwKDe8pV21i0BfsnujMolTsgvql5CzVfG8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aFHVn5+ykafFRFhd0msqquxwDkSHW1iNLQPpThJ46xY80BgGw9se/+uID4QKw8voY
 JBIVHqxM+jpt33W0Url5uVEPDbexrlv4DTSL+r6PzQytuGsisjGBc3NjyzX0PCfgJq
 oyB7H3LB6vWVA0qHbIyYNyAVakpfDvKdr9z3bs1HHORzqMD1Ca3t6AITx6Mb2i1xJr
 4eaqqGo6z7j2ZdweIw+Fk/Tkn8jjDWdmkyrSJFr/5O/29zu9ljwvHaYMKfo440j4zz
 n+NhSa4EVlfTvypb/rEEe/Nss0xmCMzdWLiE1ddLtXvhYRD7IgHKExswidX2e4hPmj
 KMMGXRWfXre0Q==
Date: Thu, 26 Feb 2026 10:55:36 -0500
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-34-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9424; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=1IUHG0qj9DwKDe8pV21i0BfsnujMolTsgvql5CzVfG8=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0MpBOcUdKLBTbmmPN0jNpJrcykq5KO06rQp
 tLi/hHQ+TuJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtDAAKCRAADmhBGVaC
 Ff+PEAC5tkujedJlI5dNofD8jtTXYzd0VpVlyWlSrfhEGqjiHukcPMO0c1zVxH5MXYLkcyVwa8W
 2ongG+07LNoHjWzSlOfbZTYeIynxNz9ziwJ7XuFgd9PC8TpE5meZoxZ+0ccRaYBntRRR4b16gnn
 rKL2DWj9kR6R+vfU7qQ9O8afq0USJ5eHt5a/yVc0zCGZLbVVRtqUuhDO0AU04VICjX2tEQG7CEL
 rMo0bVun85JDOpF0ywj/TvJEXaIalHwU7i/KRgKU46n7sd9b3MUKRVsxAeO5x+bZu84potKQldm
 mWZgA78bdlGr0gsl/hxkIl4tGX7F7aYz2hf2I+3ostgNMwdZy/2Vb9+MLrPcjUmcPR7625jh57p
 7P6bv11Zl1Taz4r4Z9qrJumhPerXLmNLsQV0efRBzHfrFXwy68KZqdMrwHmYEHYF6me+dyyQqqA
 uGAsJMdIi/2We5FfwejdT0bNboCd2cVSr4EQHo7ec6UZeFvVxDNMl4MRsN0Qil4Ver6Ic1+lCgv
 ELHmNCO32Rn+Zf8XeNokgMCvNUdaIE29+Kcmplwx69NKlUUVLBoTfx1m65ZGY/AmBQYK68lfFtT
 ydaRFb6cCt+R0BIT02Zg91pmqBHk3EG9DDuct2OtI4cKzdQkxC8lDJRIKiscAX3+kJ03Geqwc4i
 A3lzjSYyHqWsFFQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Update format strings and local variable types in hfsplus
 for the i_ino type change from unsigned long to u64. Signed-off-by: Jeff
 Layton
 <jlayton@kernel.org> --- fs/hfsplus/attributes.c | 10 +++++-----
 fs/hfsplus/catalog.c
 | 2 +- fs/hfsplus/dir.c | 6 +++--- fs/hfsplus/extents.c | 6 +++---
 fs/hfsplus/inode.c | [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vvdpw-0005Yp-C2
Subject: [f2fs-dev] [PATCH 34/61] hfsplus: update format strings for u64
 i_ino
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,goodmis.org,efficios.com,intel.com,infradead.org,mit.edu,linux.dev,suse.de,redhat.com,manguebit.org,dilger.ca,suse.com,oracle.com,brown.name,talpey.com,samba.org,gmail.com,microsoft.com,dubeyko.com,ionkov.net,codewreck.org,crudebyte.com,auristor.com,themaw.net,cs.cmu.edu,fluxnic.net,tyhicks.com,physik.fu-berlin.de,vivo.com,artax.karlin.mff.cuni.cz,nod.at,paragon-software.com,fasheh.com,evilplan.org,linux.alibaba.com,omnibond.com,szeredi.hu,alarsen.net,huawei.com,wdc.com,canonical.com,paul-moore.com,namei.org,hallyn.com,linux.ibm.com,schaufler-ca.com,amd.com,ffwll.ch,linaro.org,google.com,davemloft.net,arm.com,linux.intel.com,dev.tdt.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[str.name:query timed out];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[146];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[jlayton@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[str.name:url,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: F3B0D1A97DE
X-Rspamd-Action: no action

Update format strings and local variable types in hfsplus for the
i_ino type change from unsigned long to u64.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/hfsplus/attributes.c | 10 +++++-----
 fs/hfsplus/catalog.c    |  2 +-
 fs/hfsplus/dir.c        |  6 +++---
 fs/hfsplus/extents.c    |  6 +++---
 fs/hfsplus/inode.c      |  8 ++++----
 fs/hfsplus/super.c      |  6 +++---
 fs/hfsplus/xattr.c      | 10 +++++-----
 7 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/fs/hfsplus/attributes.c b/fs/hfsplus/attributes.c
index 4b79cd606276e31c20fa18ef3a099596f50e8a0f..e3d8fe1e7e75d9895c4ae30810a334412b4c105a 100644
--- a/fs/hfsplus/attributes.c
+++ b/fs/hfsplus/attributes.c
@@ -203,7 +203,7 @@ int hfsplus_create_attr_nolock(struct inode *inode, const char *name,
 	int entry_size;
 	int err;
 
-	hfs_dbg("name %s, ino %ld\n",
+	hfs_dbg("name %s, ino %lld\n",
 		name ? name : NULL, inode->i_ino);
 
 	if (name) {
@@ -255,7 +255,7 @@ int hfsplus_create_attr(struct inode *inode,
 	hfsplus_attr_entry *entry_ptr;
 	int err;
 
-	hfs_dbg("name %s, ino %ld\n",
+	hfs_dbg("name %s, ino %lld\n",
 		name ? name : NULL, inode->i_ino);
 
 	if (!HFSPLUS_SB(sb)->attr_tree) {
@@ -337,7 +337,7 @@ int hfsplus_delete_attr_nolock(struct inode *inode, const char *name,
 	struct super_block *sb = inode->i_sb;
 	int err;
 
-	hfs_dbg("name %s, ino %ld\n",
+	hfs_dbg("name %s, ino %lld\n",
 		name ? name : NULL, inode->i_ino);
 
 	if (name) {
@@ -367,7 +367,7 @@ int hfsplus_delete_attr(struct inode *inode, const char *name)
 	struct super_block *sb = inode->i_sb;
 	struct hfs_find_data fd;
 
-	hfs_dbg("name %s, ino %ld\n",
+	hfs_dbg("name %s, ino %lld\n",
 		name ? name : NULL, inode->i_ino);
 
 	if (!HFSPLUS_SB(sb)->attr_tree) {
@@ -436,7 +436,7 @@ int hfsplus_replace_attr(struct inode *inode,
 	hfsplus_attr_entry *entry_ptr;
 	int err = 0;
 
-	hfs_dbg("name %s, ino %ld\n",
+	hfs_dbg("name %s, ino %lld\n",
 		name ? name : NULL, inode->i_ino);
 
 	if (!HFSPLUS_SB(sb)->attr_tree) {
diff --git a/fs/hfsplus/catalog.c b/fs/hfsplus/catalog.c
index 02c1eee4a4b86059ceaab7a7c68ab65adba6fa26..0e961e99b9856ab7d95da5d070b4fbce1e67ebde 100644
--- a/fs/hfsplus/catalog.c
+++ b/fs/hfsplus/catalog.c
@@ -441,7 +441,7 @@ int hfsplus_rename_cat(u32 cnid,
 	int entry_size, type;
 	int err;
 
-	hfs_dbg("cnid %u - ino %lu, name %s - ino %lu, name %s\n",
+	hfs_dbg("cnid %u - ino %llu, name %s - ino %llu, name %s\n",
 		cnid, src_dir->i_ino, src_name->name,
 		dst_dir->i_ino, dst_name->name);
 	err = hfs_find_init(HFSPLUS_SB(sb)->cat_tree, &src_fd);
diff --git a/fs/hfsplus/dir.c b/fs/hfsplus/dir.c
index d559bf8625f853d50fd316d157cf8afe22069565..054f6da46033404bbbcf299beb5d8765495c0de3 100644
--- a/fs/hfsplus/dir.c
+++ b/fs/hfsplus/dir.c
@@ -313,7 +313,7 @@ static int hfsplus_link(struct dentry *src_dentry, struct inode *dst_dir,
 	if (!S_ISREG(inode->i_mode))
 		return -EPERM;
 
-	hfs_dbg("src_dir->i_ino %lu, dst_dir->i_ino %lu, inode->i_ino %lu\n",
+	hfs_dbg("src_dir->i_ino %llu, dst_dir->i_ino %llu, inode->i_ino %llu\n",
 		src_dir->i_ino, dst_dir->i_ino, inode->i_ino);
 
 	mutex_lock(&sbi->vh_mutex);
@@ -385,7 +385,7 @@ static int hfsplus_unlink(struct inode *dir, struct dentry *dentry)
 	if (HFSPLUS_IS_RSRC(inode))
 		return -EPERM;
 
-	hfs_dbg("dir->i_ino %lu, inode->i_ino %lu\n",
+	hfs_dbg("dir->i_ino %llu, inode->i_ino %llu\n",
 		dir->i_ino, inode->i_ino);
 
 	mutex_lock(&sbi->vh_mutex);
@@ -393,7 +393,7 @@ static int hfsplus_unlink(struct inode *dir, struct dentry *dentry)
 	if (inode->i_ino == cnid &&
 	    atomic_read(&HFSPLUS_I(inode)->opencnt)) {
 		str.name = name;
-		str.len = sprintf(name, "temp%lu", inode->i_ino);
+		str.len = sprintf(name, "temp%llu", inode->i_ino);
 		res = hfsplus_rename_cat(inode->i_ino,
 					 dir, &dentry->d_name,
 					 sbi->hidden_dir, &str);
diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
index 8e886514d27f1e5d4d94be75142f197669e62234..474fde1a1653be6cf74b26e757c6d8a6f8d2906a 100644
--- a/fs/hfsplus/extents.c
+++ b/fs/hfsplus/extents.c
@@ -275,7 +275,7 @@ int hfsplus_get_block(struct inode *inode, sector_t iblock,
 	mutex_unlock(&hip->extents_lock);
 
 done:
-	hfs_dbg("ino %lu, iblock %llu - dblock %u\n",
+	hfs_dbg("ino %llu, iblock %llu - dblock %u\n",
 		inode->i_ino, (long long)iblock, dblock);
 
 	mask = (1 << sbi->fs_shift) - 1;
@@ -476,7 +476,7 @@ int hfsplus_file_extend(struct inode *inode, bool zeroout)
 			goto out;
 	}
 
-	hfs_dbg("ino %lu, start %u, len %u\n", inode->i_ino, start, len);
+	hfs_dbg("ino %llu, start %u, len %u\n", inode->i_ino, start, len);
 
 	if (hip->alloc_blocks <= hip->first_blocks) {
 		if (!hip->first_blocks) {
@@ -545,7 +545,7 @@ void hfsplus_file_truncate(struct inode *inode)
 	u32 alloc_cnt, blk_cnt, start;
 	int res;
 
-	hfs_dbg("ino %lu, phys_size %llu -> i_size %llu\n",
+	hfs_dbg("ino %llu, phys_size %llu -> i_size %llu\n",
 		inode->i_ino, (long long)hip->phys_size, inode->i_size);
 
 	if (inode->i_size > hip->phys_size) {
diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
index 922ff41df042a83d47364f2d941c45dabda29afb..02be32dc6833dfdd767c407ec0263485d1a2c3c6 100644
--- a/fs/hfsplus/inode.c
+++ b/fs/hfsplus/inode.c
@@ -230,7 +230,7 @@ static int hfsplus_get_perms(struct inode *inode,
 		inode->i_flags &= ~S_APPEND;
 	return 0;
 bad_type:
-	pr_err("invalid file type 0%04o for inode %lu\n", mode, inode->i_ino);
+	pr_err("invalid file type 0%04o for inode %llu\n", mode, inode->i_ino);
 	return -EIO;
 }
 
@@ -328,7 +328,7 @@ int hfsplus_file_fsync(struct file *file, loff_t start, loff_t end,
 	struct hfsplus_vh *vhdr = sbi->s_vhdr;
 	int error = 0, error2;
 
-	hfs_dbg("inode->i_ino %lu, start %llu, end %llu\n",
+	hfs_dbg("inode->i_ino %llu, start %llu, end %llu\n",
 		inode->i_ino, start, end);
 
 	error = file_write_and_wait_range(file, start, end);
@@ -639,7 +639,7 @@ int hfsplus_cat_write_inode(struct inode *inode)
 	hfsplus_cat_entry entry;
 	int res = 0;
 
-	hfs_dbg("inode->i_ino %lu\n", inode->i_ino);
+	hfs_dbg("inode->i_ino %llu\n", inode->i_ino);
 
 	if (HFSPLUS_IS_RSRC(inode))
 		main_inode = HFSPLUS_I(inode)->rsrc_inode;
@@ -716,7 +716,7 @@ int hfsplus_cat_write_inode(struct inode *inode)
 	if (!res) {
 		res = hfs_btree_write(tree);
 		if (res) {
-			pr_err("b-tree write err: %d, ino %lu\n",
+			pr_err("b-tree write err: %d, ino %llu\n",
 			       res, inode->i_ino);
 		}
 	}
diff --git a/fs/hfsplus/super.c b/fs/hfsplus/super.c
index 7229a8ae89f9469109b1c3a317ee9b7705a83f8b..b3917249c206c3a25fe98b39a5eb2168b7404dc2 100644
--- a/fs/hfsplus/super.c
+++ b/fs/hfsplus/super.c
@@ -156,7 +156,7 @@ static int hfsplus_system_write_inode(struct inode *inode)
 		int err = hfs_btree_write(tree);
 
 		if (err) {
-			pr_err("b-tree write err: %d, ino %lu\n",
+			pr_err("b-tree write err: %d, ino %llu\n",
 			       err, inode->i_ino);
 			return err;
 		}
@@ -169,7 +169,7 @@ static int hfsplus_write_inode(struct inode *inode,
 {
 	int err;
 
-	hfs_dbg("ino %lu\n", inode->i_ino);
+	hfs_dbg("ino %llu\n", inode->i_ino);
 
 	err = hfsplus_ext_write_extent(inode);
 	if (err)
@@ -184,7 +184,7 @@ static int hfsplus_write_inode(struct inode *inode,
 
 static void hfsplus_evict_inode(struct inode *inode)
 {
-	hfs_dbg("ino %lu\n", inode->i_ino);
+	hfs_dbg("ino %llu\n", inode->i_ino);
 	truncate_inode_pages_final(&inode->i_data);
 	clear_inode(inode);
 	if (HFSPLUS_IS_RSRC(inode)) {
diff --git a/fs/hfsplus/xattr.c b/fs/hfsplus/xattr.c
index 9904944cbd54e3d326591fa65a5ed678f38ca583..c70bb6f494b22b1e3f74e18a9ef378e0c87f8194 100644
--- a/fs/hfsplus/xattr.c
+++ b/fs/hfsplus/xattr.c
@@ -277,7 +277,7 @@ int __hfsplus_setxattr(struct inode *inode, const char *name,
 	u16 folder_finderinfo_len = sizeof(DInfo) + sizeof(DXInfo);
 	u16 file_finderinfo_len = sizeof(FInfo) + sizeof(FXInfo);
 
-	hfs_dbg("ino %lu, name %s, value %p, size %zu\n",
+	hfs_dbg("ino %llu, name %s, value %p, size %zu\n",
 		inode->i_ino, name ? name : NULL,
 		value, size);
 
@@ -447,7 +447,7 @@ int hfsplus_setxattr(struct inode *inode, const char *name,
 		NLS_MAX_CHARSET_SIZE * HFSPLUS_ATTR_MAX_STRLEN + 1;
 	int res;
 
-	hfs_dbg("ino %lu, name %s, prefix %s, prefixlen %zu, "
+	hfs_dbg("ino %llu, name %s, prefix %s, prefixlen %zu, "
 		"value %p, size %zu\n",
 		inode->i_ino, name ? name : NULL,
 		prefix ? prefix : NULL, prefixlen,
@@ -607,7 +607,7 @@ ssize_t hfsplus_getxattr(struct inode *inode, const char *name,
 	int res;
 	char *xattr_name;
 
-	hfs_dbg("ino %lu, name %s, prefix %s\n",
+	hfs_dbg("ino %llu, name %s, prefix %s\n",
 		inode->i_ino, name ? name : NULL,
 		prefix ? prefix : NULL);
 
@@ -717,7 +717,7 @@ ssize_t hfsplus_listxattr(struct dentry *dentry, char *buffer, size_t size)
 	size_t strbuf_size;
 	int xattr_name_len;
 
-	hfs_dbg("ino %lu\n", inode->i_ino);
+	hfs_dbg("ino %llu\n", inode->i_ino);
 
 	if (!is_xattr_operation_supported(inode))
 		return -EOPNOTSUPP;
@@ -819,7 +819,7 @@ static int hfsplus_removexattr(struct inode *inode, const char *name)
 	int is_xattr_acl_deleted;
 	int is_all_xattrs_deleted;
 
-	hfs_dbg("ino %lu, name %s\n",
+	hfs_dbg("ino %llu, name %s\n",
 		inode->i_ino, name ? name : NULL);
 
 	if (!HFSPLUS_SB(inode->i_sb)->attr_tree)

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
