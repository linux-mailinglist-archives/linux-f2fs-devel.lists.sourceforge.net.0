Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNOBGyBwoGk3jgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:09:04 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6B21A9AF1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:09:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4TTHEQHucm2HfszgNqKeZA5GLIe6ulR5CRCJpI0oyw=; b=SCuidtnS7mbwkPcdlpiQaJHfxI
	wavfimURHA6FhzxzRdIuZrRXkSQ74v9ogDze0pSFQODwQRreTyy85xA0b169vbo0WTKVtlXLqZ6Gt
	eQ+6r+bhfrfAxuQDHyWwUVXSm0g0VXVaCrR0sOkGWv+3N+0CuY+NUyplMRo4BBKmuZ+I=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvdvB-0003D0-Lz;
	Thu, 26 Feb 2026 16:09:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vvdvA-0003CX-8a;
 Thu, 26 Feb 2026 16:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O9LAoJV9LH+taYO5AwamiyX+EB2QV+KeNUvGXrYq1jg=; b=fW6rRGuz6A7VgzqPGpDV0wrldX
 C/RRxL9vH2DiUiba+JC/wp/pWxyzUTLtcow99iUe5knLDOplKJ+tmLpsCFlz2WzxhJU5J+ArbrVDF
 clUfm9RKC/NT27zkRw3RopDg8PJIWvG3bwcABCSWCEJIuEiG3eh+k9z4cXrBKS3P5M0w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O9LAoJV9LH+taYO5AwamiyX+EB2QV+KeNUvGXrYq1jg=; b=Kt4025FzvNBoAQhUFFRbWMDcXH
 92NGJGcZlhs4JZcn0XLJW5NH7/CW7SZE4p8JgXAt0wa9o56+z5YqyY+IZARmoGKQ3+KQQ51iFPSdT
 qNhstg7fgIPzwo5fitmmTKEgE06Wfco3hA6SnZ7bl9ymkY7aaoKZ/94E18oMN0EN51fw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvdv9-0006OK-4R; Thu, 26 Feb 2026 16:09:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BB63941737;
 Thu, 26 Feb 2026 16:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4276CC19424;
 Thu, 26 Feb 2026 16:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772122128;
 bh=yMxrwlo1L23M3jdcu34tHVP1Ixv5RcybzgMboES2iR8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=geD1d/Cl0KUpz2YfLhxC/AoZZfxKJA4u9lIBS2HkxWA8Hx7hsjnAbYXEih/CGmRqD
 LVWTT0tSwjcIL+SAjJSCMAIJwI7Rh0cedz8CQdt+grwr3gDHQBBOp4kUUC5IZh2rCD
 YozSERTGvmg0Ab5/3zB0bT1WiK3o0F/7IHPNE4/nv63d9pnsI6ho8dTgnAWMRSdwz3
 7QSjm7ClZ0YiZe6R735Pz+tuGDS9OlvIjxswkNZzz+I7FprQdo4MIoPL8+WYVpqM2Z
 Al/96Nx23hsJUR/l9PdZvKwm023EifedygUH2OxYAqr8jBPDsnBJjIWPsRDM9vRwnA
 3HY2y42nlluBQ==
Date: Thu, 26 Feb 2026 10:56:02 -0500
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-60-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3384; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=yMxrwlo1L23M3jdcu34tHVP1Ixv5RcybzgMboES2iR8=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0TNF9E4LLtLcsmECJBuNkdznTFUOqAaHS51
 /JvsKaS9z+JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtEwAKCRAADmhBGVaC
 FVEfEAC1TwV64E1qKBJGckhNYVvwlSnX3rZDmQIxDFcxGZxtVBrVBOh2xoX2257tybZOBJSqjCY
 /Jte1PxTGc4kxiGRavFnxhO0wlYVPsTLoPG94BoDKhz1miBESmIct0tKqcpeXaw2MHdWCplxDch
 X1cRMKR9hwR4/ixDuEsCW1iKfbQNuXMWZBr3BrVhNzZK1xNPDr7dxd9AmAPY1LrHouzZQ1ggbqQ
 rWD41Lvbt3AavTNMr2XWEkgwFo0b8KJFx/9kxmZER1NumwIwrPm0KnWdFiT1ZSdWDFCXY3/sgqu
 Yjw7fVD1U93qqOOQ09+rlcBcw3yDs/8NMx/lcKaZ8hm5z//43tn1RSsUAN4Ya7t7Y9oB394tHbV
 oZdHQoaKvs0HWGmKOSpvuWdtQuyGheZPeqJz808UIJLyoznw/bt28KM+4Lzf1c+nh+5Y98vRab+
 zi7dLUSdsiLpZ4IQqrlDNeeXLj7jGLq0XlBl5h9wpsD/98SsO7OTNibIvHqI24iBQ75a3kAjcvs
 CjOAywQF2a235aopSFuUxa98gkkLPR9m3KrCaCyx2k9QVxmzJAQbpLeHCHmgVKXJvcSgjYeIJEl
 bncoKnZPdp5XWo+5rqsQv3t8nmBbMQnY1qRoz1JUtZeIcY8c4mGkjZO1gWpQ3Fdr3BEinAdwtmG
 zqw5ZXLeAS2FUbg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Update format strings from %ld to %lld and 0L literals to
 0LL in x25, netrom, and rose proc output, now that i_ino is u64 instead of
 unsigned long. Signed-off-by: Jeff Layton <jlayton@kernel.org> ---
 net/netrom/af_netrom.c
 | 4 ++-- net/rose/af_rose.c | 4 ++-- net/x25/x25_proc.c | 4 ++-- 3 files
 changed, 6 insertions(+), 6 deletions(-) 
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
X-Headers-End: 1vvdv9-0006OK-4R
Subject: [f2fs-dev] [PATCH 60/61] net: update legacy protocol format strings
 for u64 i_ino
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[jlayton@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 8B6B21A9AF1
X-Rspamd-Action: no action

Update format strings from %ld to %lld and 0L literals to 0LL in
x25, netrom, and rose proc output, now that i_ino is u64 instead
of unsigned long.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 net/netrom/af_netrom.c | 4 ++--
 net/rose/af_rose.c     | 4 ++--
 net/x25/x25_proc.c     | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
index b816c56124ab8b7e59689e612d36007bb11aacaa..c9f12ea75f2f8f941d9bc2f3167b91608448819d 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -1305,7 +1305,7 @@ static int nr_info_show(struct seq_file *seq, void *v)
 		seq_printf(seq, "%-9s ", ax2asc(buf, &nr->user_addr));
 		seq_printf(seq, "%-9s ", ax2asc(buf, &nr->dest_addr));
 		seq_printf(seq,
-"%-9s %-3s  %02X/%02X %02X/%02X %2d %3d %3d %3d %3lu/%03lu %2lu/%02lu %3lu/%03lu %3lu/%03lu %2d/%02d %3d %5d %5d %ld\n",
+"%-9s %-3s  %02X/%02X %02X/%02X %2d %3d %3d %3d %3lu/%03lu %2lu/%02lu %3lu/%03lu %3lu/%03lu %2d/%02d %3d %5d %5d %lld\n",
 			ax2asc(buf, &nr->source_addr),
 			devname,
 			nr->my_index,
@@ -1329,7 +1329,7 @@ static int nr_info_show(struct seq_file *seq, void *v)
 			nr->window,
 			sk_wmem_alloc_get(s),
 			sk_rmem_alloc_get(s),
-			s->sk_socket ? SOCK_INODE(s->sk_socket)->i_ino : 0L);
+			s->sk_socket ? SOCK_INODE(s->sk_socket)->i_ino : 0LL);
 
 		bh_unlock_sock(s);
 	}
diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index 841d62481048def8d800779efb6e4ea8cbe419fe..bbecad799c60cd74c62f2b2a01909f03547a0d4f 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -1479,7 +1479,7 @@ static int rose_info_show(struct seq_file *seq, void *v)
 			callsign = ax2asc(buf, &rose->source_call);
 
 		seq_printf(seq,
-			   "%-10s %-9s %-5s %3.3X %05d  %d  %d  %d  %d %3lu %3lu %3lu %3lu %3lu %3lu/%03lu %5d %5d %ld\n",
+			   "%-10s %-9s %-5s %3.3X %05d  %d  %d  %d  %d %3lu %3lu %3lu %3lu %3lu %3lu/%03lu %5d %5d %lld\n",
 			rose2asc(rsbuf, &rose->source_addr),
 			callsign,
 			devname,
@@ -1498,7 +1498,7 @@ static int rose_info_show(struct seq_file *seq, void *v)
 			rose->idle / (60 * HZ),
 			sk_wmem_alloc_get(s),
 			sk_rmem_alloc_get(s),
-			s->sk_socket ? SOCK_INODE(s->sk_socket)->i_ino : 0L);
+			s->sk_socket ? SOCK_INODE(s->sk_socket)->i_ino : 0LL);
 	}
 
 	return 0;
diff --git a/net/x25/x25_proc.c b/net/x25/x25_proc.c
index 0412814a2295bba5e26f4c95697ef7b7ba5fb34f..697fdfef297826e2dc267b89e34fd6a54f862a3f 100644
--- a/net/x25/x25_proc.c
+++ b/net/x25/x25_proc.c
@@ -96,7 +96,7 @@ static int x25_seq_socket_show(struct seq_file *seq, void *v)
 		devname = x25->neighbour->dev->name;
 
 	seq_printf(seq, "%-10s %-10s %-5s %3.3X  %d  %d  %d  %d %3lu %3lu "
-			"%3lu %3lu %3lu %5d %5d %ld\n",
+			"%3lu %3lu %3lu %5d %5d %lld\n",
 		   !x25->dest_addr.x25_addr[0] ? "*" : x25->dest_addr.x25_addr,
 		   !x25->source_addr.x25_addr[0] ? "*" : x25->source_addr.x25_addr,
 		   devname, x25->lci & 0x0FFF, x25->state, x25->vs, x25->vr,
@@ -104,7 +104,7 @@ static int x25_seq_socket_show(struct seq_file *seq, void *v)
 		   x25->t21 / HZ, x25->t22 / HZ, x25->t23 / HZ,
 		   sk_wmem_alloc_get(s),
 		   sk_rmem_alloc_get(s),
-		   s->sk_socket ? SOCK_INODE(s->sk_socket)->i_ino : 0L);
+		   s->sk_socket ? SOCK_INODE(s->sk_socket)->i_ino : 0LL);
 out:
 	return 0;
 }

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
