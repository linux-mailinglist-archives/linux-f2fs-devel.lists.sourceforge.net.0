Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Oj+AYbypWkeIQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:26:46 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BBA1DF572
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:26:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AONssgJjWOsUbbuqrblEqp2CVpkIkKbKKfpwXI8VoMI=; b=C/pyDNePVztrxtG/0u8yOejXiS
	Mrvee251D5NA+c9zZW3kQhCp0QSPVza5z1QKyCO4QZqVOvsO2GCxP4EPWSXDGn6jyWFVzbsCy5E7T
	WKjBflfXbEd80WdHMsRkFTuKOvUwLvJ4DTqPzTI6Ddj6RBg1kYCaV9tBEV38zGA+TgyQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vx9qk-0001u6-TK;
	Mon, 02 Mar 2026 20:26:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vx9qj-0001tc-QF;
 Mon, 02 Mar 2026 20:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F2EFXBW9cw+4Gcm7rvALn3mSmsNRosffOGrAbthhfm0=; b=cCtc0VcgtjfrSDnIbXOpHX3CLF
 nbBoVg4Bzzq2lR1NfV4FM2VVRcWr9AKuImkr8y4Rm701duBn/o8EPB5sb9BYdCbZfrxKB4ZFBH0hb
 UOkfLcOi5nnVe8NQ6vJJbGs4yF4+rTIdZDCuV8U7ylERevNXvF/Bpc8MctBwCaE8gB0I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F2EFXBW9cw+4Gcm7rvALn3mSmsNRosffOGrAbthhfm0=; b=LgkZr9HFrqSFydyMuzBCGnYM3k
 fzUUBVQFMfOG+dCTeRrmb2r0ueNYFLBvo2KWtg5x/kQwSKUQLcKXvBY82bt7HWBf/Yz3jmT53dvPo
 sXHakmyQcWc6+bhEV8tJS721BcSA03P8rOJSHg56GpHhqWaz2Bs/0u3tljzHdcx1buBY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vx9qf-0004Yx-HO; Mon, 02 Mar 2026 20:26:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2559B406CD;
 Mon,  2 Mar 2026 20:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E16CCC2BCB8;
 Mon,  2 Mar 2026 20:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772483187;
 bh=eoNvK5Yl7SeIQgq9YrEwF9MuEybDgaw/cGTOe/274yY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gZESrDHFBopSybBDaCrr/gadYhHmmqGteyjtsyw9Pv1m1XE6MLR/cdhwN0RnwNFCX
 QPrCN5JSpeWOwodlWI4OQoNjzrc5vHUaGjO2R8dzz/MOqJGKpmclBoUCuwxHU3vGCL
 +70+lpClDBk9cuezXISD0YdDWnhmpbXqHaFyn5wOKnrl1NqphXwc9iKmGSfeqobEi1
 l6maOnpOdK1oOk8r8/lcVzrZtBYJX61HKxrTgPal3sbXhizaPR33lnmh/tdmaWhaLj
 hEnaPacjOr2dqigfZtNesqwNm+Yl1BP/O5LbH0tfBVx/U5/dXCsco+Za3w/B6J8LkS
 mtYyh35Kv+06A==
Date: Mon, 02 Mar 2026 15:23:50 -0500
MIME-Version: 1.0
Message-Id: <20260302-iino-u64-v2-6-e5388800dae0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13682; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=eoNvK5Yl7SeIQgq9YrEwF9MuEybDgaw/cGTOe/274yY=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBppfHwneWwRCtH37qDPSjc8Wo97edXJDLDHXsih
 RCid9s596mJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaXx8AAKCRAADmhBGVaC
 FeXoD/40MQDB8ZGY3bAmS4aZn5ULoTZ7fhEUkxxa3aguvcw00rG2zuF/QNLGsDtg4gEE1YIGOg7
 xDxs5j4PXMy+C+Snbg5wk+/G/TXdL98RBqUJeZAsaVfQ+C+vVeuowoIxyY5WtgZmXVdQjwQrRbZ
 Tnz0m6PdPeWy/iwJGXMpG26DhkYKaKpFaC/D8alFD7tZqrIQhBeL3/HJTevsTAJJUQr19ohUjFY
 vhqACbzEwStOkD7DyJHw+1pYJTP2uT3IzOgAgiROmYyrGW8F8TwjIjrRp66I1Ov0fnjPSPzkJst
 9+yium6UMI+Oup1WDiyc9FXahpKE1uX3b5kyPOlnUeO7oirOc7www3Cyp6L+tNhMfUB5aT4F7VK
 +CMvIKE2OX+IaN/pMOKc48PLUb3GwfVRMjz/Marq/QE2hMuuNWlWVuO7eI0MVk3MtXxeUC0/Puk
 w7sX4hWrKYPEO6rr/KdhRp5biPoU7ezh520WhVEWmCjAQ5jHs7aibCAk+q/TUjXMp5Nuvq8ON1E
 1MigX6VhzzLKer3JNYYOGpndOkW5GlfF3gp/35EeeOa72WEkbs0B+VRblNznDCUD7KDC51pQUci
 m14ODDyp/XhBlXNdVLeMolvVzZBv5q2BWwD+8uhjnUY/clrz9z7+e4IgpcRcVK21zO959Q9AD7q
 idB+xSxglbMDOWw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The recent conversion of ino_t/unsigned long inode number
 fields to u64 in VFS-layer trace events can leave alignment holes on 32-bit
 platforms (particularly ARM, where u64 has 8-byte alignment). Reor [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
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
X-Headers-End: 1vx9qf-0004Yx-HO
Subject: [f2fs-dev] [PATCH v2 006/110] trace: reorder TP_STRUCT__entry
 fields for better packing on 32-bit
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
X-Rspamd-Queue-Id: 16BBA1DF572
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

The recent conversion of ino_t/unsigned long inode number fields to u64
in VFS-layer trace events can leave alignment holes on 32-bit platforms
(particularly ARM, where u64 has 8-byte alignment). Reorder the
TP_STRUCT__entry fields so that 64-bit integer fields (u64, loff_t,
time64_t) come first, followed by pointers and unsigned longs, then
integer-sized and smaller fields.

This eliminates padding holes on 32-bit without worsening packing on
64-bit. Only the field declaration order in TP_STRUCT__entry is changed;
TP_fast_assign and TP_printk reference fields by name and are unaffected.

Files affected: cachefiles.h, filelock.h, filemap.h, hugetlbfs.h,
readahead.h, timestamp.h, writeback.h.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 include/trace/events/cachefiles.h | 10 +++++-----
 include/trace/events/filelock.h   | 22 +++++++++++-----------
 include/trace/events/filemap.h    |  4 ++--
 include/trace/events/hugetlbfs.h  | 18 +++++++++---------
 include/trace/events/readahead.h  |  6 +++---
 include/trace/events/timestamp.h  |  6 +++---
 include/trace/events/writeback.h  | 32 ++++++++++++++++----------------
 7 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
index f967027711ee823f224abc1b8ab03f63da06ae6f..6e3b1424eea4dc9e414dd9d1439339132d516339 100644
--- a/include/trace/events/cachefiles.h
+++ b/include/trace/events/cachefiles.h
@@ -249,10 +249,10 @@ TRACE_EVENT(cachefiles_lookup,
 	    TP_ARGS(obj, dir, de),
 
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		obj)
-		    __field(short,			error)
 		    __field(u64,			dino)
 		    __field(u64,			ino)
+		    __field(unsigned int,		obj)
+		    __field(short,			error)
 			     ),
 
 	    TP_fast_assign(
@@ -578,8 +578,8 @@ TRACE_EVENT(cachefiles_mark_active,
 
 	    /* Note that obj may be NULL */
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		obj)
 		    __field(u64,			inode)
+		    __field(unsigned int,		obj)
 			     ),
 
 	    TP_fast_assign(
@@ -599,8 +599,8 @@ TRACE_EVENT(cachefiles_mark_failed,
 
 	    /* Note that obj may be NULL */
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		obj)
 		    __field(u64,			inode)
+		    __field(unsigned int,		obj)
 			     ),
 
 	    TP_fast_assign(
@@ -620,8 +620,8 @@ TRACE_EVENT(cachefiles_mark_inactive,
 
 	    /* Note that obj may be NULL */
 	    TP_STRUCT__entry(
-		    __field(unsigned int,		obj)
 		    __field(u64,			inode)
+		    __field(unsigned int,		obj)
 			     ),
 
 	    TP_fast_assign(
diff --git a/include/trace/events/filelock.h b/include/trace/events/filelock.h
index 41bc752616b25d6cd7955203e2c604029d0b440c..1167748862449ef6ff04c40b568ea8c3bbb08207 100644
--- a/include/trace/events/filelock.h
+++ b/include/trace/events/filelock.h
@@ -43,9 +43,9 @@ TRACE_EVENT(locks_get_lock_context,
 
 	TP_STRUCT__entry(
 		__field(u64, i_ino)
+		__field(struct file_lock_context *, ctx)
 		__field(dev_t, s_dev)
 		__field(unsigned char, type)
-		__field(struct file_lock_context *, ctx)
 	),
 
 	TP_fast_assign(
@@ -66,16 +66,16 @@ DECLARE_EVENT_CLASS(filelock_lock,
 	TP_ARGS(inode, fl, ret),
 
 	TP_STRUCT__entry(
-		__field(struct file_lock *, fl)
 		__field(u64, i_ino)
-		__field(dev_t, s_dev)
+		__field(loff_t, fl_start)
+		__field(loff_t, fl_end)
+		__field(struct file_lock *, fl)
 		__field(struct file_lock_core *, blocker)
 		__field(fl_owner_t, owner)
+		__field(dev_t, s_dev)
 		__field(unsigned int, pid)
 		__field(unsigned int, flags)
 		__field(unsigned char, type)
-		__field(loff_t, fl_start)
-		__field(loff_t, fl_end)
 		__field(int, ret)
 	),
 
@@ -123,15 +123,15 @@ DECLARE_EVENT_CLASS(filelock_lease,
 	TP_ARGS(inode, fl),
 
 	TP_STRUCT__entry(
-		__field(struct file_lease *, fl)
 		__field(u64, i_ino)
-		__field(dev_t, s_dev)
+		__field(struct file_lease *, fl)
 		__field(struct file_lock_core *, blocker)
 		__field(fl_owner_t, owner)
-		__field(unsigned int, flags)
-		__field(unsigned char, type)
 		__field(unsigned long, break_time)
 		__field(unsigned long, downgrade_time)
+		__field(dev_t, s_dev)
+		__field(unsigned int, flags)
+		__field(unsigned char, type)
 	),
 
 	TP_fast_assign(
@@ -176,11 +176,11 @@ TRACE_EVENT(generic_add_lease,
 
 	TP_STRUCT__entry(
 		__field(u64, i_ino)
+		__field(fl_owner_t, owner)
+		__field(dev_t, s_dev)
 		__field(int, wcount)
 		__field(int, rcount)
 		__field(int, icount)
-		__field(dev_t, s_dev)
-		__field(fl_owner_t, owner)
 		__field(unsigned int, flags)
 		__field(unsigned char, type)
 	),
diff --git a/include/trace/events/filemap.h b/include/trace/events/filemap.h
index 153491e57cce6df73e30ddee60a52ed7d8923c24..4dcf8e9e2e0d8bde7c9df9856c059d2cdebff59f 100644
--- a/include/trace/events/filemap.h
+++ b/include/trace/events/filemap.h
@@ -20,8 +20,8 @@ DECLARE_EVENT_CLASS(mm_filemap_op_page_cache,
 	TP_ARGS(folio),
 
 	TP_STRUCT__entry(
-		__field(unsigned long, pfn)
 		__field(u64, i_ino)
+		__field(unsigned long, pfn)
 		__field(unsigned long, index)
 		__field(dev_t, s_dev)
 		__field(unsigned char, order)
@@ -171,8 +171,8 @@ TRACE_EVENT(file_check_and_advance_wb_err,
 		TP_ARGS(file, old),
 
 		TP_STRUCT__entry(
-			__field(struct file *, file)
 			__field(u64, i_ino)
+			__field(struct file *, file)
 			__field(dev_t, s_dev)
 			__field(errseq_t, old)
 			__field(errseq_t, new)
diff --git a/include/trace/events/hugetlbfs.h b/include/trace/events/hugetlbfs.h
index d4fefa571b829f92729c7e175df9ad5ed701131a..8ba72c1d4f4d8ba616906be5b5c4b487972fec00 100644
--- a/include/trace/events/hugetlbfs.h
+++ b/include/trace/events/hugetlbfs.h
@@ -14,9 +14,9 @@ TRACE_EVENT(hugetlbfs_alloc_inode,
 	TP_ARGS(inode, dir, mode),
 
 	TP_STRUCT__entry(
-		__field(dev_t,		dev)
 		__field(u64,		ino)
 		__field(u64,		dir)
+		__field(dev_t,		dev)
 		__field(__u16,		mode)
 	),
 
@@ -40,13 +40,13 @@ DECLARE_EVENT_CLASS(hugetlbfs__inode,
 	TP_ARGS(inode),
 
 	TP_STRUCT__entry(
-		__field(dev_t,		dev)
 		__field(u64,		ino)
-		__field(__u16,		mode)
 		__field(loff_t,		size)
+		__field(blkcnt_t,	blocks)
+		__field(dev_t,		dev)
 		__field(unsigned int,	nlink)
 		__field(unsigned int,	seals)
-		__field(blkcnt_t,	blocks)
+		__field(__u16,		mode)
 	),
 
 	TP_fast_assign(
@@ -87,14 +87,14 @@ TRACE_EVENT(hugetlbfs_setattr,
 	TP_ARGS(inode, dentry, attr),
 
 	TP_STRUCT__entry(
-		__field(dev_t,		dev)
 		__field(u64,		ino)
+		__field(loff_t,		old_size)
+		__field(loff_t,		ia_size)
+		__field(dev_t,		dev)
 		__field(unsigned int,	d_len)
 		__string(d_name,	dentry->d_name.name)
 		__field(unsigned int,	ia_valid)
 		__field(unsigned int,	ia_mode)
-		__field(loff_t,		old_size)
-		__field(loff_t,		ia_size)
 	),
 
 	TP_fast_assign(
@@ -122,12 +122,12 @@ TRACE_EVENT(hugetlbfs_fallocate,
 	TP_ARGS(inode, mode, offset, len, ret),
 
 	TP_STRUCT__entry(
-		__field(dev_t,		dev)
 		__field(u64,		ino)
-		__field(int,		mode)
 		__field(loff_t,		offset)
 		__field(loff_t,		len)
 		__field(loff_t,		size)
+		__field(dev_t,		dev)
+		__field(int,		mode)
 		__field(int,		ret)
 	),
 
diff --git a/include/trace/events/readahead.h b/include/trace/events/readahead.h
index 928b2c67654735cc004d27beeee2066196e60a70..087f171e2b02d30f09179d5ed6c27a7e0224370b 100644
--- a/include/trace/events/readahead.h
+++ b/include/trace/events/readahead.h
@@ -81,15 +81,15 @@ DECLARE_EVENT_CLASS(page_cache_ra_op,
 
 	TP_STRUCT__entry(
 		__field(u64, i_ino)
-		__field(dev_t, s_dev)
+		__field(loff_t, prev_pos)
 		__field(pgoff_t, index)
+		__field(unsigned long, req_count)
+		__field(dev_t, s_dev)
 		__field(unsigned int, order)
 		__field(unsigned int, size)
 		__field(unsigned int, async_size)
 		__field(unsigned int, ra_pages)
 		__field(unsigned int, mmap_miss)
-		__field(loff_t, prev_pos)
-		__field(unsigned long, req_count)
 	),
 
 	TP_fast_assign(
diff --git a/include/trace/events/timestamp.h b/include/trace/events/timestamp.h
index 315ea8d57796617661768da24591d53095ac7649..d6503612dddf9c6a2f785fad549fa04adddb06fe 100644
--- a/include/trace/events/timestamp.h
+++ b/include/trace/events/timestamp.h
@@ -18,9 +18,9 @@ DECLARE_EVENT_CLASS(ctime,
 	TP_ARGS(inode, ctime),
 
 	TP_STRUCT__entry(
-		__field(dev_t,		dev)
 		__field(u64,		ino)
 		__field(time64_t,	ctime_s)
+		__field(dev_t,		dev)
 		__field(u32,		ctime_ns)
 		__field(u32,		gen)
 	),
@@ -58,8 +58,8 @@ TRACE_EVENT(ctime_ns_xchg,
 	TP_ARGS(inode, old, new, cur),
 
 	TP_STRUCT__entry(
-		__field(dev_t,		dev)
 		__field(u64,		ino)
+		__field(dev_t,		dev)
 		__field(u32,		gen)
 		__field(u32,		old)
 		__field(u32,		new)
@@ -93,10 +93,10 @@ TRACE_EVENT(fill_mg_cmtime,
 	TP_ARGS(inode, ctime, mtime),
 
 	TP_STRUCT__entry(
-		__field(dev_t,		dev)
 		__field(u64,		ino)
 		__field(time64_t,	ctime_s)
 		__field(time64_t,	mtime_s)
+		__field(dev_t,		dev)
 		__field(u32,		ctime_ns)
 		__field(u32,		mtime_ns)
 		__field(u32,		gen)
diff --git a/include/trace/events/writeback.h b/include/trace/events/writeback.h
index ad269142f3f9a288d87e5252f08e8a17fd06e8d5..e5cd2b80fd29dba9177b8ea7c37d63e50e9f60e2 100644
--- a/include/trace/events/writeback.h
+++ b/include/trace/events/writeback.h
@@ -280,9 +280,9 @@ TRACE_EVENT(track_foreign_dirty,
 		__array(char,		name, 32)
 		__field(u64,		bdi_id)
 		__field(u64,		ino)
-		__field(unsigned int,	memcg_id)
 		__field(u64,		cgroup_ino)
 		__field(u64,		page_cgroup_ino)
+		__field(unsigned int,	memcg_id)
 	),
 
 	TP_fast_assign(
@@ -346,8 +346,8 @@ DECLARE_EVENT_CLASS(writeback_write_inode_template,
 	TP_STRUCT__entry (
 		__array(char, name, 32)
 		__field(u64, ino)
-		__field(int, sync_mode)
 		__field(u64, cgroup_ino)
+		__field(int, sync_mode)
 	),
 
 	TP_fast_assign(
@@ -385,6 +385,7 @@ DECLARE_EVENT_CLASS(writeback_work_class,
 	TP_ARGS(wb, work),
 	TP_STRUCT__entry(
 		__array(char, name, 32)
+		__field(u64, cgroup_ino)
 		__field(long, nr_pages)
 		__field(dev_t, sb_dev)
 		__field(int, sync_mode)
@@ -392,7 +393,6 @@ DECLARE_EVENT_CLASS(writeback_work_class,
 		__field(int, range_cyclic)
 		__field(int, for_background)
 		__field(int, reason)
-		__field(u64, cgroup_ino)
 	),
 	TP_fast_assign(
 		strscpy_pad(__entry->name, bdi_dev_name(wb->bdi), 32);
@@ -482,15 +482,15 @@ DECLARE_EVENT_CLASS(wbc_class,
 	TP_ARGS(wbc, bdi),
 	TP_STRUCT__entry(
 		__array(char, name, 32)
+		__field(u64, cgroup_ino)
 		__field(long, nr_to_write)
 		__field(long, pages_skipped)
+		__field(long, range_start)
+		__field(long, range_end)
 		__field(int, sync_mode)
 		__field(int, for_kupdate)
 		__field(int, for_background)
 		__field(int, range_cyclic)
-		__field(long, range_start)
-		__field(long, range_end)
-		__field(u64, cgroup_ino)
 	),
 
 	TP_fast_assign(
@@ -535,11 +535,11 @@ TRACE_EVENT(writeback_queue_io,
 	TP_ARGS(wb, work, dirtied_before, moved),
 	TP_STRUCT__entry(
 		__array(char,		name, 32)
+		__field(u64,		cgroup_ino)
 		__field(unsigned long,	older)
 		__field(long,		age)
 		__field(int,		moved)
 		__field(int,		reason)
-		__field(u64,		cgroup_ino)
 	),
 	TP_fast_assign(
 		strscpy_pad(__entry->name, bdi_dev_name(wb->bdi), 32);
@@ -614,13 +614,13 @@ TRACE_EVENT(bdi_dirty_ratelimit,
 
 	TP_STRUCT__entry(
 		__array(char,		bdi, 32)
+		__field(u64,		cgroup_ino)
 		__field(unsigned long,	write_bw)
 		__field(unsigned long,	avg_write_bw)
 		__field(unsigned long,	dirty_rate)
 		__field(unsigned long,	dirty_ratelimit)
 		__field(unsigned long,	task_ratelimit)
 		__field(unsigned long,	balanced_dirty_ratelimit)
-		__field(u64,		cgroup_ino)
 	),
 
 	TP_fast_assign(
@@ -667,6 +667,7 @@ TRACE_EVENT(balance_dirty_pages,
 
 	TP_STRUCT__entry(
 		__array(	 char,	bdi, 32)
+		__field(u64,		cgroup_ino)
 		__field(unsigned long,	limit)
 		__field(unsigned long,	setpoint)
 		__field(unsigned long,	dirty)
@@ -674,13 +675,12 @@ TRACE_EVENT(balance_dirty_pages,
 		__field(unsigned long,	wb_dirty)
 		__field(unsigned long,	dirty_ratelimit)
 		__field(unsigned long,	task_ratelimit)
-		__field(unsigned int,	dirtied)
-		__field(unsigned int,	dirtied_pause)
 		__field(unsigned long,	paused)
 		__field(	 long,	pause)
 		__field(unsigned long,	period)
 		__field(	 long,	think)
-		__field(u64,		cgroup_ino)
+		__field(unsigned int,	dirtied)
+		__field(unsigned int,	dirtied_pause)
 	),
 
 	TP_fast_assign(
@@ -738,9 +738,9 @@ TRACE_EVENT(writeback_sb_inodes_requeue,
 	TP_STRUCT__entry(
 		__array(char, name, 32)
 		__field(u64, ino)
+		__field(u64, cgroup_ino)
 		__field(unsigned long, state)
 		__field(unsigned long, dirtied_when)
-		__field(u64, cgroup_ino)
 	),
 
 	TP_fast_assign(
@@ -774,12 +774,12 @@ DECLARE_EVENT_CLASS(writeback_single_inode_template,
 	TP_STRUCT__entry(
 		__array(char, name, 32)
 		__field(u64, ino)
+		__field(u64, cgroup_ino)
 		__field(unsigned long, state)
 		__field(unsigned long, dirtied_when)
 		__field(unsigned long, writeback_index)
-		__field(long, nr_to_write)
 		__field(unsigned long, wrote)
-		__field(u64, cgroup_ino)
+		__field(long, nr_to_write)
 	),
 
 	TP_fast_assign(
@@ -828,11 +828,11 @@ DECLARE_EVENT_CLASS(writeback_inode_template,
 	TP_ARGS(inode),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
 		__field(	u64,	ino			)
 		__field(unsigned long,	state			)
-		__field(	__u16, mode			)
 		__field(unsigned long, dirtied_when		)
+		__field(	dev_t,	dev			)
+		__field(	__u16, mode			)
 	),
 
 	TP_fast_assign(

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
