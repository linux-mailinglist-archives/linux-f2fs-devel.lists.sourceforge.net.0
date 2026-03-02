Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAsbA9H0pWkxIQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:36:33 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EE81DFDDE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:36:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgHMAYFDvA2AxCVfL84FinBGL8xxEfaqNGJ2MNNU3vo=; b=WOOMg0bnp57Sz+0kPtt9eZQgsq
	meaMR+J3P6VysFmEJuJbrBxb3CPqAmTET8gJdiFO1UGkUPg2Xm8lXUrmwbtDWYVK8StXiadYN1N2L
	ncEzrDTbCGF0evkEkc2fihmNO7634pvIPTZQy88M/9Jo5JG8rqwq1f2q5SbUOy038cKU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxA0D-0003Iu-JC;
	Mon, 02 Mar 2026 20:36:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vxA0B-0003IO-RS;
 Mon, 02 Mar 2026 20:36:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Stiwy+8hAqOPM36499lL4VuCAEvMe7Bk4QeNFasmLsY=; b=MjInDH1o3lJcPGNQK01zXS/VFU
 uQW8+kkBN4CvXK5z7bc+lKxAZuXEzAt0IkvRFUxYvLQwBnFXH/YikGh8LKTMzuM43vxi7QhYtB51s
 I6R9VvRvmXmfz6okKRINPVTlhqsbkZsumq06nNGo6UKM1vR17fnB58OIe9DXw9vHM7BU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Stiwy+8hAqOPM36499lL4VuCAEvMe7Bk4QeNFasmLsY=; b=Egj43v86dhmD7fhsXxVMtZ0TMq
 NsHVsbdWhszOSssJlEbFp1P/Ai4l7YfsVkI8EV6Frnh9w5IP7ZUzq0FRmXmmP30EAV6X+TQ4HOJKJ
 1iST9eW81Q5z0di5mSKlKuiVmsPod/huGT1zqDxrIZxBL8EFuKLtPb1Hyrpp03QsfPLM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxA0B-0005fG-0X; Mon, 02 Mar 2026 20:36:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A20ED42CED;
 Mon,  2 Mar 2026 20:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68853C2BCB3;
 Mon,  2 Mar 2026 20:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772483776;
 bh=2D5RY10D3f9EA9VpSCyHAUgXnN1Zhdx+XHZEceYHLkw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=D28UfErKl1eVcmih3OCYqwtJEuipyNBp9pccWN4O90PfjlQCfkkqiKjHx0aD063mq
 l821fn1Q2d9BAIgMPaDT6IfrQUygarHlZB4m+fsBbydlI2jsHc1vHUoRf6RM+GdM0m
 /FVKPTbWxqvtfYUVIqsR8nj/U2sD7GLB2Ls9Ru5l+x/v38Jfw6FpxolDHaxAoIyaA+
 8Sx8d9SB+FgceSv49vWPXcCRFJEGFdyB8MA3zKxF/dknpmKpl3PTOwupPpI5NnZKFZ
 j6rLDF+JnhA01/h5fNLCayGWtR0S/VuDR72pkdqZq+useJcEkMg3c9QWpOiqJNRued
 +3gaPWPXWwOBw==
Date: Mon, 02 Mar 2026 15:24:31 -0500
MIME-Version: 1.0
Message-Id: <20260302-iino-u64-v2-47-e5388800dae0@kernel.org>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
In-Reply-To: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
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
 Martin Schiller <ms@dev.tdt.de>, Eric Paris <eparis@redhat.com>, 
 Joerg Reuter <jreuter@yaina.de>, Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Oliver Hartkopp <socketcan@hartkopp.net>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, David Ahern <dsahern@kernel.org>, 
 Neal Cardwell <ncardwell@google.com>, 
 Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Remi Denis-Courmont <courmisch@gmail.com>, 
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
 Xin Long <lucien.xin@gmail.com>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9430; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=2D5RY10D3f9EA9VpSCyHAUgXnN1Zhdx+XHZEceYHLkw=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBppfH7rH5PHRctdRRgjkwiK9qGagiBnv38zWs92
 EflSEcxid6JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaXx+wAKCRAADmhBGVaC
 FSh3D/4/PsJte0gi8dRA0elfhS2fQq0Q5BLWsJIRQ0v1yNUSYVJBfsKc21wLkeg28VhyxcPrBdB
 wV8K4/ffWGU7hs5jUXnMevIziT5Ni0HtqEJgdX79aoxyyblykf5U/2r5meRVpQWJ3pW9a6vlPMn
 n+5vlifF8JzJqiEOoiilUeT/eI+sj1LVaytSk9qgSIFYoz0qcO+aP0tflWOtQESjcDQpNn5fiTI
 cfJPvelPlPF1zzoS9suzIcAYeSJ41/BYVlfNp5y6si/Yq/1Bi1g35jmTPIfSQYKS5VVlDOXWFXS
 E/KoPB7IsQZGsFQ89C3T7aaaVk18XUhffxKeodoFgKmb3sFpxJ53fttSUL6XISkSomzHH3tbsrH
 +/zRf21W/uqcXY7lLxPLSKtAA7ZnDaPi1aIT61mPsi7cKtf8E3YEmGmyCW4nxiVQ8oSWomZYYaD
 TXwkCIXmDp6cbw/OBcsiDQM1jSeSB6QigN9xYFvYTx+KvDtVrtUeWPigEenILHOS33QJR6aiYMO
 WV5VDgDnKrStOWXcyvzqqbnUbWSYvNoNP5hUCSXAby8uLfxo85MxPHYxefD5fjJtAR6QQDnfum0
 M31wgdYwMrbWW7LrWYZcx3bdukHRB0f7bamrCtoxYs/3A5nL69KoTjrgLZqyP4xaYXJyD2qvmPp
 02rS3BwD2CnpO7A==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert ufs i_ino format strings to use the PRIino format
 macro in preparation for the widening of i_ino via kino_t. Remove
 now-unnecessary
 (unsigned long) casts on i_ino. Signed-off-by: Jeff Layton
 <jlayton@kernel.org>
 --- fs/ufs/balloc.c | 6 +++--- fs/ufs/dir.c | 10 +++++----- fs/ufs/ialloc.c
 | 6 +++--- fs/ufs/inode.c | 18 +++++++++--------- fs/ufs/ufs_fs.h | 6 +++---
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxA0B-0005fG-0X
Subject: [f2fs-dev] [PATCH v2 047/110] ufs: use PRIino format for i_ino
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
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org, linux-sctp@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-x25@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, codalist@coda.cs.cmu.edu,
 linux-ext4@vger.kernel.org, bpf@vger.kernel.org, devel@lists.orangefs.org,
 linux-trace-kernel@vger.kernel.org, ecryptfs@vger.kernel.org,
 selinux@vger.kernel.org, autofs@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-media@vger.kernel.org, linux-can@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, ocfs2-devel@lists.linux.dev,
 linux-fscrypt@vger.kernel.org, linux-hams@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-xfs@vger.kernel.org,
 fsverity@lists.linux.dev, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 v9fs@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-perf-users@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, linux-integrity@vger.kernel.org, ntfs3@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 31EE81DFDDE
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
	FREEMAIL_TO(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,goodmis.org,efficios.com,intel.com,infradead.org,mit.edu,linux.dev,suse.de,redhat.com,manguebit.org,dilger.ca,suse.com,oracle.com,brown.name,talpey.com,samba.org,gmail.com,microsoft.com,dubeyko.com,ionkov.net,codewreck.org,crudebyte.com,auristor.com,themaw.net,cs.cmu.edu,fluxnic.net,tyhicks.com,physik.fu-berlin.de,vivo.com,artax.karlin.mff.cuni.cz,nod.at,paragon-software.com,fasheh.com,evilplan.org,linux.alibaba.com,omnibond.com,szeredi.hu,alarsen.net,huawei.com,wdc.com,canonical.com,paul-moore.com,namei.org,hallyn.com,linux.ibm.com,schaufler-ca.com,amd.com,ffwll.ch,linaro.org,google.com,davemloft.net,arm.com,linux.intel.com,dev.tdt.de,yaina.de,holtmann.org,hartkopp.net,pengutronix.de,secunet.com,gondor.apana.org.au,fomichev.me,iogearbox.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[172];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[jlayton@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

Convert ufs i_ino format strings to use the PRIino format
macro in preparation for the widening of i_ino via kino_t.

Remove now-unnecessary (unsigned long) casts on i_ino.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ufs/balloc.c |  6 +++---
 fs/ufs/dir.c    | 10 +++++-----
 fs/ufs/ialloc.c |  6 +++---
 fs/ufs/inode.c  | 18 +++++++++---------
 fs/ufs/ufs_fs.h |  6 +++---
 fs/ufs/util.c   |  2 +-
 6 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/fs/ufs/balloc.c b/fs/ufs/balloc.c
index 194ed3ab945e3eae94db085ee8d37eb1a4439470..b961daa05608fa52dcfc2702bb97c437ef27d9c2 100644
--- a/fs/ufs/balloc.c
+++ b/fs/ufs/balloc.c
@@ -245,7 +245,7 @@ static void ufs_change_blocknr(struct inode *inode, sector_t beg,
 	sector_t end, i;
 	struct buffer_head *head, *bh;
 
-	UFSD("ENTER, ino %lu, count %u, oldb %llu, newb %llu\n",
+	UFSD("ENTER, ino %" PRIino "u, count %u, oldb %llu, newb %llu\n",
 	      inode->i_ino, count,
 	     (unsigned long long)oldb, (unsigned long long)newb);
 
@@ -340,7 +340,7 @@ u64 ufs_new_fragments(struct inode *inode, void *p, u64 fragment,
 	unsigned cgno, oldcount, newcount;
 	u64 tmp, request, result;
 	
-	UFSD("ENTER, ino %lu, fragment %llu, goal %llu, count %u\n",
+	UFSD("ENTER, ino %" PRIino "u, fragment %llu, goal %llu, count %u\n",
 	     inode->i_ino, (unsigned long long)fragment,
 	     (unsigned long long)goal, count);
 	
@@ -583,7 +583,7 @@ static u64 ufs_alloc_fragments(struct inode *inode, unsigned cgno,
 	unsigned oldcg, i, j, k, allocsize;
 	u64 result;
 	
-	UFSD("ENTER, ino %lu, cgno %u, goal %llu, count %u\n",
+	UFSD("ENTER, ino %" PRIino "u, cgno %u, goal %llu, count %u\n",
 	     inode->i_ino, cgno, (unsigned long long)goal, count);
 
 	sb = inode->i_sb;
diff --git a/fs/ufs/dir.c b/fs/ufs/dir.c
index 43f1578ab8666a9611d4a77f5aababfce812fbe4..c7a13e01119f990b8f7139fdc3005e7b65afeb54 100644
--- a/fs/ufs/dir.c
+++ b/fs/ufs/dir.c
@@ -150,7 +150,7 @@ static bool ufs_check_folio(struct folio *folio, char *kaddr)
 
 Ebadsize:
 	ufs_error(sb, __func__,
-		  "size of directory #%lu is not a multiple of chunk size",
+		  "size of directory #%" PRIino "u is not a multiple of chunk size",
 		  dir->i_ino
 	);
 	goto fail;
@@ -169,7 +169,7 @@ static bool ufs_check_folio(struct folio *folio, char *kaddr)
 Einumber:
 	error = "inode out of bounds";
 bad_entry:
-	ufs_error(sb, __func__, "bad entry in directory #%lu: %s - "
+	ufs_error(sb, __func__, "bad entry in directory #%" PRIino "u: %s - "
 		   "offset=%llu, rec_len=%d, name_len=%d",
 		   dir->i_ino, error, folio_pos(folio) + offs,
 		   rec_len, ufs_get_de_namlen(sb, p));
@@ -177,7 +177,7 @@ static bool ufs_check_folio(struct folio *folio, char *kaddr)
 Eend:
 	p = (struct ufs_dir_entry *)(kaddr + offs);
 	ufs_error(sb, __func__,
-		   "entry in directory #%lu spans the page boundary"
+		   "entry in directory #%" PRIino "u spans the page boundary"
 		   "offset=%llu",
 		   dir->i_ino, folio_pos(folio) + offs);
 fail:
@@ -258,7 +258,7 @@ struct ufs_dir_entry *ufs_find_entry(struct inode *dir, const struct qstr *qstr,
 	struct ufs_inode_info *ui = UFS_I(dir);
 	struct ufs_dir_entry *de;
 
-	UFSD("ENTER, dir_ino %lu, name %s, namlen %u\n", dir->i_ino, name, namelen);
+	UFSD("ENTER, dir_ino %" PRIino "u, name %s, namlen %u\n", dir->i_ino, name, namelen);
 
 	if (npages == 0 || namelen > UFS_MAXNAMLEN)
 		goto out;
@@ -434,7 +434,7 @@ ufs_readdir(struct file *file, struct dir_context *ctx)
 
 		if (IS_ERR(kaddr)) {
 			ufs_error(sb, __func__,
-				  "bad page in #%lu",
+				  "bad page in #%" PRIino "u",
 				  inode->i_ino);
 			ctx->pos += PAGE_SIZE - offset;
 			return PTR_ERR(kaddr);
diff --git a/fs/ufs/ialloc.c b/fs/ufs/ialloc.c
index 73531827ecee12b3dff09aef0acc0e374b00fb29..f26fbe330a1d0e053ddf8dbe2a8ec5d41373c79f 100644
--- a/fs/ufs/ialloc.c
+++ b/fs/ufs/ialloc.c
@@ -63,7 +63,7 @@ void ufs_free_inode (struct inode * inode)
 	int is_directory;
 	unsigned ino, cg, bit;
 	
-	UFSD("ENTER, ino %lu\n", inode->i_ino);
+	UFSD("ENTER, ino %" PRIino "u\n", inode->i_ino);
 
 	sb = inode->i_sb;
 	uspi = UFS_SB(sb)->s_uspi;
@@ -317,7 +317,7 @@ struct inode *ufs_new_inode(struct inode *dir, umode_t mode)
 		bh = sb_bread(sb, uspi->s_sbbase + ufs_inotofsba(inode->i_ino));
 		if (!bh) {
 			ufs_warning(sb, "ufs_read_inode",
-				    "unable to read inode %lu\n",
+				    "unable to read inode %" PRIino "u\n",
 				    inode->i_ino);
 			err = -EIO;
 			goto fail_remove_inode;
@@ -336,7 +336,7 @@ struct inode *ufs_new_inode(struct inode *dir, umode_t mode)
 	}
 	mutex_unlock(&sbi->s_lock);
 
-	UFSD("allocating inode %lu\n", inode->i_ino);
+	UFSD("allocating inode %" PRIino "u\n", inode->i_ino);
 	UFSD("EXIT\n");
 	return inode;
 
diff --git a/fs/ufs/inode.c b/fs/ufs/inode.c
index e2b0a35de2a7000f46a298114c1dcaffa17c43dc..199f5f71f77b20bfde408cb1ac7a8ea8c45cc465 100644
--- a/fs/ufs/inode.c
+++ b/fs/ufs/inode.c
@@ -400,7 +400,7 @@ static int ufs_getfrag_block(struct inode *inode, sector_t fragment, struct buff
 
 	mutex_lock(&UFS_I(inode)->truncate_mutex);
 
-	UFSD("ENTER, ino %lu, fragment %llu\n", inode->i_ino, (unsigned long long)fragment);
+	UFSD("ENTER, ino %" PRIino "u, fragment %llu\n", inode->i_ino, (unsigned long long)fragment);
 	if (unlikely(!depth)) {
 		ufs_warning(sb, "ufs_get_block", "block > big");
 		err = -EIO;
@@ -595,7 +595,7 @@ static int ufs2_read_inode(struct inode *inode, struct ufs2_inode *ufs2_inode)
 	struct super_block *sb = inode->i_sb;
 	umode_t mode;
 
-	UFSD("Reading ufs2 inode, ino %lu\n", inode->i_ino);
+	UFSD("Reading ufs2 inode, ino %" PRIino "u\n", inode->i_ino);
 	/*
 	 * Copy data to the in-core inode.
 	 */
@@ -662,7 +662,7 @@ struct inode *ufs_iget(struct super_block *sb, unsigned long ino)
 
 	bh = sb_bread(sb, uspi->s_sbbase + ufs_inotofsba(inode->i_ino));
 	if (!bh) {
-		ufs_warning(sb, "ufs_read_inode", "unable to read inode %lu\n",
+		ufs_warning(sb, "ufs_read_inode", "unable to read inode %" PRIino "u\n",
 			    inode->i_ino);
 		goto bad_inode;
 	}
@@ -793,17 +793,17 @@ static int ufs_update_inode(struct inode * inode, int do_sync)
 	struct ufs_sb_private_info *uspi = UFS_SB(sb)->s_uspi;
 	struct buffer_head * bh;
 
-	UFSD("ENTER, ino %lu\n", inode->i_ino);
+	UFSD("ENTER, ino %" PRIino "u\n", inode->i_ino);
 
 	if (inode->i_ino < UFS_ROOTINO ||
 	    inode->i_ino > (uspi->s_ncg * uspi->s_ipg)) {
-		ufs_warning (sb, "ufs_read_inode", "bad inode number (%lu)\n", inode->i_ino);
+		ufs_warning (sb, "ufs_read_inode", "bad inode number (%" PRIino "u)\n", inode->i_ino);
 		return -1;
 	}
 
 	bh = sb_bread(sb, ufs_inotofsba(inode->i_ino));
 	if (!bh) {
-		ufs_warning (sb, "ufs_read_inode", "unable to read inode %lu\n", inode->i_ino);
+		ufs_warning (sb, "ufs_read_inode", "unable to read inode %" PRIino "u\n", inode->i_ino);
 		return -1;
 	}
 	if (uspi->fs_magic == UFS2_MAGIC) {
@@ -891,7 +891,7 @@ static void ufs_trunc_direct(struct inode *inode)
 	unsigned int old_tail, new_tail;
 	struct to_free ctx = {.inode = inode};
 
-	UFSD("ENTER: ino %lu\n", inode->i_ino);
+	UFSD("ENTER: ino %" PRIino "u\n", inode->i_ino);
 
 	new_frags = DIRECT_FRAGMENT;
 	// new_frags = first fragment past the new EOF
@@ -956,7 +956,7 @@ static void ufs_trunc_direct(struct inode *inode)
 		}
 	}
 done:
-	UFSD("EXIT: ino %lu\n", inode->i_ino);
+	UFSD("EXIT: ino %" PRIino "u\n", inode->i_ino);
 }
 
 static void free_full_branch(struct inode *inode, u64 ind_block, int depth)
@@ -1169,7 +1169,7 @@ static int ufs_truncate(struct inode *inode, loff_t size)
 {
 	int err = 0;
 
-	UFSD("ENTER: ino %lu, i_size: %llu, old_i_size: %llu\n",
+	UFSD("ENTER: ino %" PRIino "u, i_size: %llu, old_i_size: %llu\n",
 	     inode->i_ino, (unsigned long long)size,
 	     (unsigned long long)i_size_read(inode));
 
diff --git a/fs/ufs/ufs_fs.h b/fs/ufs/ufs_fs.h
index 0905f9a16b9150b656bd6d8966c0f8cc220b439d..b8dc354ae90f4a0839303f89c87bd2940db62b99 100644
--- a/fs/ufs/ufs_fs.h
+++ b/fs/ufs/ufs_fs.h
@@ -226,10 +226,10 @@ typedef __u16 __bitwise __fs16;
  *     inode number to cylinder group number.
  *     inode number to file system block address.
  */
-#define	ufs_inotocg(x)		((x) / uspi->s_ipg)
-#define	ufs_inotocgoff(x)	((x) % uspi->s_ipg)
+#define	ufs_inotocg(x)		((unsigned int)(x) / uspi->s_ipg)
+#define	ufs_inotocgoff(x)	((unsigned int)(x) % uspi->s_ipg)
 #define	ufs_inotofsba(x)	(((u64)ufs_cgimin(ufs_inotocg(x))) + ufs_inotocgoff(x) / uspi->s_inopf)
-#define	ufs_inotofsbo(x)	((x) % uspi->s_inopf)
+#define	ufs_inotofsbo(x)	((unsigned int)(x) % uspi->s_inopf)
 
 /*
  * Compute the cylinder and rotational position of a cyl block addr.
diff --git a/fs/ufs/util.c b/fs/ufs/util.c
index 034b1d82c355ca49ec917e98dcfcc6d80e6eb00b..9acb59697d85015e83cd1e59ffbccb5452e6dd2d 100644
--- a/fs/ufs/util.c
+++ b/fs/ufs/util.c
@@ -203,7 +203,7 @@ struct folio *ufs_get_locked_folio(struct address_space *mapping,
 		folio = read_mapping_folio(mapping, index, NULL);
 
 		if (IS_ERR(folio)) {
-			printk(KERN_ERR "ufs_change_blocknr: read_mapping_folio error: ino %lu, index: %lu\n",
+			printk(KERN_ERR "ufs_change_blocknr: read_mapping_folio error: ino %" PRIino "u, index: %lu\n",
 			       mapping->host->i_ino, index);
 			return folio;
 		}

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
