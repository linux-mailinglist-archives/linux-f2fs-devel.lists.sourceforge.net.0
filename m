Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WO3cFMbypWn6IAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:27:50 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B81A01DF628
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:27:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2CM4PkJMRPKPj9dCzlIJfe3XHkmrj40exYJ3uFN4g0=; b=g8AqiL6P6TYqwHWZLF8kSEzvNq
	IjooRH4ty+E4TatWbhcliJof41jukdPYUaZ9kMxGC/KeLtTHBPyf8jb41WDlONL86TR2UfjxKxFOk
	NHadCBWkVt1NOsWu8JnezC5Ba6cAR4FCJML0hkZDd3HErLhFF0tbNs99FRhKd5V/63JM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vx9ro-00043H-EL;
	Mon, 02 Mar 2026 20:27:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vx9rn-00042k-5i;
 Mon, 02 Mar 2026 20:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2vDBxat5F3/bMnis3lCGTt5QFDoqlpbhRWu0krsspH0=; b=YuVO01doYYzfhw5f15cmM2MSjW
 NzTuds87SvlY3vgBUthMb94TbYpTW/dMfS0nKUTS8bmAwMWxJ1G5MT7lMbBoe0fStqqDmgDM2MxX3
 FaaSccZe1ngfbYZxb37V8siF3IHPw1TEd4JSmkSRhc2kCBVD+Bb7+9A9UPG9biuzMBok=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2vDBxat5F3/bMnis3lCGTt5QFDoqlpbhRWu0krsspH0=; b=YfhPnUReMeqR22gcFwILL4xanA
 rVNwics767lMJ9DIqVmLeCmGC3JIvsbApxjXOyOa/qphDhOOQ8BkZzSaqnZDNpkFfU9WFPQE3d/jc
 E9KIchAEquWGD0xsovmJJxL6TWnPzWCaygR27S/j/YSe6H1DjYDLukLVq6AdCBRSEpNE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vx9rl-0004gm-4Y; Mon, 02 Mar 2026 20:27:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0405C60131;
 Mon,  2 Mar 2026 20:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDC8C2BCC6;
 Mon,  2 Mar 2026 20:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772483258;
 bh=G4EPy7Pq05uNoLyHzs/6sFEMGAsKLKmM5Lo9955ZGjE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=MnGBqwrVT4pjHh2pWOoo27Edr8966wN36IpLgacyCDkWZx9F9x5zHnRw6GnZVbYH7
 wOKcDfgZmxVJmuLpl9lQXtuTExgXATfBud1XjeHERBX8IZTkdrcZ5GiZEczBR5Pvhf
 TswIEkP8LSZKrjLPQAs/Rkp+i/bEAhP7tJUKmVxF38KlAkZndj6na8L1lZt2TUdyTo
 BFZwCWJcxWcnXKU1eO5aRdnDG+Z+3fFOD+UEAR4CVq5+NNREq9E975Fe25CPb4lYAh
 cygJDzB6U7tk8rKP6hhCjsIPci85ScxIbky2lMM6f/h6/5Qscr7KqUkjj9Cn5p/F2D
 InIsXTRipxQRg==
Date: Mon, 02 Mar 2026 15:23:55 -0500
MIME-Version: 1.0
Message-Id: <20260302-iino-u64-v2-11-e5388800dae0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14403; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=G4EPy7Pq05uNoLyHzs/6sFEMGAsKLKmM5Lo9955ZGjE=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBppfHyftibhhLZs6aC5I7+mR6gKwCUcoWM5c+X5
 NyGs9Mn1Z6JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaXx8gAKCRAADmhBGVaC
 FX06EADTh6qq4AvyEbQ73V3y8NR+EYKgyZSIkk+GD1UTrxdRxXUuXVhB33M+q5E6Byg3czI0zcH
 rSMh3eqa0r6yeQwCelGzK3w1thlLwl/UDQq4cRcDOKsOvxSga2ZkcFQe1UU4pQ0LsZI8kWNkNE7
 8EMI9qUCwMwCYnuPvMIeyxiHmbXFelN3ZpOk9lwqc8I/YkkmCrNbPO9CGoO+HDuFxJF9BtHgHyI
 iLhg4xlb1f1gK4TllxFLUsQ7wWao/WRb4PvYMFKLdTBYiFpmhtQGhA5EE/6ToyjEz2EdC+pOAlV
 rIxBo7rxEup+yluQTuUS6ifi7Cd2UH6gbJhsXkNGYMpNhnoYgc4q1lFvJmlnifthEL+sluwMPwb
 HkAEB6jjjP4+1R8loL9Vlzn9XjWrkZkr79HLNNQ7T1ISIOV1r1lvO/PI7dOIQrNJ7E/qwhSy8Ey
 a6lgMX9Pdt+5zE8T79C1OS2TvEg1aRHPz3Mq3Wf+pm4T7yMozAwBMAwjpIbwYa+08ij+zQ/PWxM
 6SB+DyMaCkqrAOFPfHb8/g/JembB2/cfPcaotRKqx8VeKWd5s71kLmcNxxWn5x+g5RaDE3h5qCY
 1qYDZ08CjfMAt3u1uNc9V8qwLkm4e9QLHNWKbocrlj86NuwU/FcZ0jl7OKI3RsNvDZI9phSjGn4
 pjfjI+yyO/UukCQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert nfs i_ino format strings to use the PRIino format
 macro in preparation for the widening of i_ino via kino_t. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/nfs/dir.c | 20 ++++++++++
 fs/nfs/file.c
 | 8 ++++---- fs/nfs/filelayout/filelayout.c | 8 ++++----
 fs/nfs/flexfilelayout/flexfilelayout.c [...] 
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
X-Headers-End: 1vx9rl-0004gm-4Y
Subject: [f2fs-dev] [PATCH v2 011/110] nfs: use PRIino format for i_ino
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
X-Rspamd-Queue-Id: B81A01DF628
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

Convert nfs i_ino format strings to use the PRIino format
macro in preparation for the widening of i_ino via kino_t.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nfs/dir.c                           | 20 ++++++++++----------
 fs/nfs/file.c                          |  8 ++++----
 fs/nfs/filelayout/filelayout.c         |  8 ++++----
 fs/nfs/flexfilelayout/flexfilelayout.c |  8 ++++----
 fs/nfs/inode.c                         |  6 +++---
 fs/nfs/nfs4proc.c                      |  4 ++--
 fs/nfs/pnfs.c                          | 12 ++++++------
 7 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index 2402f57c8e7d932c4656a1439f1deff7954e0dc4..e69d34ab42ea30fec939cb9cbec2226967ccbadc 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -1906,7 +1906,7 @@ static int nfs_weak_revalidate(struct dentry *dentry, unsigned int flags)
 	}
 
 	error = nfs_lookup_verify_inode(inode, flags);
-	dfprintk(LOOKUPCACHE, "NFS: %s: inode %lu is %s\n",
+	dfprintk(LOOKUPCACHE, "NFS: %s: inode %" PRIino "u is %s\n",
 			__func__, inode->i_ino, error ? "invalid" : "valid");
 	return !error;
 }
@@ -2121,7 +2121,7 @@ int nfs_atomic_open(struct inode *dir, struct dentry *dentry,
 	/* Expect a negative dentry */
 	BUG_ON(d_inode(dentry));
 
-	dfprintk(VFS, "NFS: atomic_open(%s/%lu), %pd\n",
+	dfprintk(VFS, "NFS: atomic_open(%s/%" PRIino "u), %pd\n",
 			dir->i_sb->s_id, dir->i_ino, dentry);
 
 	err = nfs_check_flags(open_flags);
@@ -2404,7 +2404,7 @@ static int nfs_do_create(struct inode *dir, struct dentry *dentry,
 
 	open_flags |= O_CREAT;
 
-	dfprintk(VFS, "NFS: create(%s/%lu), %pd\n",
+	dfprintk(VFS, "NFS: create(%s/%" PRIino "u), %pd\n",
 			dir->i_sb->s_id, dir->i_ino, dentry);
 
 	attr.ia_mode = mode;
@@ -2442,7 +2442,7 @@ nfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 	struct iattr attr;
 	int status;
 
-	dfprintk(VFS, "NFS: mknod(%s/%lu), %pd\n",
+	dfprintk(VFS, "NFS: mknod(%s/%" PRIino "u), %pd\n",
 			dir->i_sb->s_id, dir->i_ino, dentry);
 
 	attr.ia_mode = mode;
@@ -2469,7 +2469,7 @@ struct dentry *nfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	struct iattr attr;
 	struct dentry *ret;
 
-	dfprintk(VFS, "NFS: mkdir(%s/%lu), %pd\n",
+	dfprintk(VFS, "NFS: mkdir(%s/%" PRIino "u), %pd\n",
 			dir->i_sb->s_id, dir->i_ino, dentry);
 
 	attr.ia_valid = ATTR_MODE;
@@ -2507,7 +2507,7 @@ int nfs_rmdir(struct inode *dir, struct dentry *dentry)
 {
 	int error;
 
-	dfprintk(VFS, "NFS: rmdir(%s/%lu), %pd\n",
+	dfprintk(VFS, "NFS: rmdir(%s/%" PRIino "u), %pd\n",
 			dir->i_sb->s_id, dir->i_ino, dentry);
 
 	trace_nfs_rmdir_enter(dir, dentry);
@@ -2578,7 +2578,7 @@ int nfs_unlink(struct inode *dir, struct dentry *dentry)
 {
 	int error;
 
-	dfprintk(VFS, "NFS: unlink(%s/%lu, %pd)\n", dir->i_sb->s_id,
+	dfprintk(VFS, "NFS: unlink(%s/%" PRIino "u, %pd)\n", dir->i_sb->s_id,
 		dir->i_ino, dentry);
 
 	trace_nfs_unlink_enter(dir, dentry);
@@ -2638,7 +2638,7 @@ int nfs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 	unsigned int pathlen = strlen(symname);
 	int error;
 
-	dfprintk(VFS, "NFS: symlink(%s/%lu, %pd, %s)\n", dir->i_sb->s_id,
+	dfprintk(VFS, "NFS: symlink(%s/%" PRIino "u, %pd, %s)\n", dir->i_sb->s_id,
 		dir->i_ino, dentry, symname);
 
 	if (pathlen > PAGE_SIZE)
@@ -2660,7 +2660,7 @@ int nfs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 	error = NFS_PROTO(dir)->symlink(dir, dentry, folio, pathlen, &attr);
 	trace_nfs_symlink_exit(dir, dentry, error);
 	if (error != 0) {
-		dfprintk(VFS, "NFS: symlink(%s/%lu, %pd, %s) error %d\n",
+		dfprintk(VFS, "NFS: symlink(%s/%" PRIino "u, %pd, %s) error %d\n",
 			dir->i_sb->s_id, dir->i_ino,
 			dentry, symname, error);
 		d_drop(dentry);
@@ -3414,7 +3414,7 @@ int nfs_permission(struct mnt_idmap *idmap,
 	if (!res && (mask & MAY_EXEC))
 		res = nfs_execute_ok(inode, mask);
 
-	dfprintk(VFS, "NFS: permission(%s/%lu), mask=0x%x, res=%d\n",
+	dfprintk(VFS, "NFS: permission(%s/%" PRIino "u), mask=0x%x, res=%d\n",
 		inode->i_sb->s_id, inode->i_ino, mask, res);
 	return res;
 out_notsup:
diff --git a/fs/nfs/file.c b/fs/nfs/file.c
index 5d08b6409c284f1ee78f1c2fa327e447eee1ab69..10ce5261c1660942203794f4a82b8e4b0d98e68e 100644
--- a/fs/nfs/file.c
+++ b/fs/nfs/file.c
@@ -391,7 +391,7 @@ static int nfs_write_begin(const struct kiocb *iocb,
 
 	trace_nfs_write_begin(file_inode(file), pos, len);
 
-	dfprintk(PAGECACHE, "NFS: write_begin(%pD2(%lu), %u@%lld)\n",
+	dfprintk(PAGECACHE, "NFS: write_begin(%pD2(%" PRIino "u), %u@%lld)\n",
 		file, mapping->host->i_ino, len, (long long) pos);
 	nfs_truncate_last_folio(mapping, i_size_read(mapping->host), pos);
 
@@ -432,7 +432,7 @@ static int nfs_write_end(const struct kiocb *iocb,
 	int status;
 
 	trace_nfs_write_end(file_inode(file), pos, len);
-	dfprintk(PAGECACHE, "NFS: write_end(%pD2(%lu), %u@%lld)\n",
+	dfprintk(PAGECACHE, "NFS: write_end(%pD2(%" PRIino "u), %u@%lld)\n",
 		file, mapping->host->i_ino, len, (long long) pos);
 
 	/*
@@ -557,7 +557,7 @@ static int nfs_launder_folio(struct folio *folio)
 	struct inode *inode = folio->mapping->host;
 	int ret;
 
-	dfprintk(PAGECACHE, "NFS: launder_folio(%ld, %llu)\n",
+	dfprintk(PAGECACHE, "NFS: launder_folio(%" PRIino "u, %llu)\n",
 		inode->i_ino, folio_pos(folio));
 
 	folio_wait_private_2(folio); /* [DEPRECATED] */
@@ -647,7 +647,7 @@ static vm_fault_t nfs_vm_page_mkwrite(struct vm_fault *vmf)
 	struct address_space *mapping;
 	struct folio *folio = page_folio(vmf->page);
 
-	dfprintk(PAGECACHE, "NFS: vm_page_mkwrite(%pD2(%lu), offset %lld)\n",
+	dfprintk(PAGECACHE, "NFS: vm_page_mkwrite(%pD2(%" PRIino "u), offset %lld)\n",
 		 filp, filp->f_mapping->host->i_ino,
 		 (long long)folio_pos(folio));
 
diff --git a/fs/nfs/filelayout/filelayout.c b/fs/nfs/filelayout/filelayout.c
index 90a11afa5d05423bb289c7f2020ef3b82707a79c..390ed5f5f92d025e179a7c07c181a8369b24ab2f 100644
--- a/fs/nfs/filelayout/filelayout.c
+++ b/fs/nfs/filelayout/filelayout.c
@@ -241,7 +241,7 @@ filelayout_set_layoutcommit(struct nfs_pgio_header *hdr)
 
 	/* Note: if the write is unstable, don't set end_offs until commit */
 	pnfs_set_layoutcommit(hdr->inode, hdr->lseg, end_offs);
-	dprintk("%s inode %lu pls_end_pos %lu\n", __func__, hdr->inode->i_ino,
+	dprintk("%s inode %" PRIino "u pls_end_pos %lu\n", __func__, hdr->inode->i_ino,
 		(unsigned long) NFS_I(hdr->inode)->layout->plh_lwb);
 }
 
@@ -456,7 +456,7 @@ filelayout_read_pagelist(struct nfs_pgio_header *hdr)
 	u32 j, idx;
 	struct nfs_fh *fh;
 
-	dprintk("--> %s ino %lu pgbase %u req %zu@%llu\n",
+	dprintk("--> %s ino %" PRIino "u pgbase %u req %zu@%llu\n",
 		__func__, hdr->inode->i_ino,
 		hdr->args.pgbase, (size_t)hdr->args.count, offset);
 
@@ -514,7 +514,7 @@ filelayout_write_pagelist(struct nfs_pgio_header *hdr, int sync)
 	if (IS_ERR(ds_clnt))
 		return PNFS_NOT_ATTEMPTED;
 
-	dprintk("%s ino %lu sync %d req %zu@%llu DS: %s cl_count %d\n",
+	dprintk("%s ino %" PRIino "u sync %d req %zu@%llu DS: %s cl_count %d\n",
 		__func__, hdr->inode->i_ino, sync, (size_t) hdr->args.count,
 		offset, ds->ds_remotestr, refcount_read(&ds->ds_clp->cl_count));
 
@@ -1001,7 +1001,7 @@ static int filelayout_initiate_commit(struct nfs_commit_data *data, int how)
 	if (IS_ERR(ds_clnt))
 		goto out_err;
 
-	dprintk("%s ino %lu, how %d cl_count %d\n", __func__,
+	dprintk("%s ino %" PRIino "u, how %d cl_count %d\n", __func__,
 		data->inode->i_ino, how, refcount_read(&ds->ds_clp->cl_count));
 	data->commit_done_cb = filelayout_commit_done_cb;
 	refcount_inc(&ds->ds_clp->cl_count);
diff --git a/fs/nfs/flexfilelayout/flexfilelayout.c b/fs/nfs/flexfilelayout/flexfilelayout.c
index f67773d52830d2ab4d12dd04caccc2077d4105e0..716ffc14cca8b0f2ab3e06c4297070129b668e9e 100644
--- a/fs/nfs/flexfilelayout/flexfilelayout.c
+++ b/fs/nfs/flexfilelayout/flexfilelayout.c
@@ -1631,7 +1631,7 @@ ff_layout_set_layoutcommit(struct inode *inode,
 		return;
 
 	pnfs_set_layoutcommit(inode, lseg, end_offset);
-	dprintk("%s inode %lu pls_end_pos %llu\n", __func__, inode->i_ino,
+	dprintk("%s inode %" PRIino "u pls_end_pos %llu\n", __func__, inode->i_ino,
 		(unsigned long long) NFS_I(inode)->layout->plh_lwb);
 }
 
@@ -2136,7 +2136,7 @@ ff_layout_read_pagelist(struct nfs_pgio_header *hdr)
 	u32 dss_id;
 	bool ds_fatal_error = false;
 
-	dprintk("--> %s ino %lu pgbase %u req %zu@%llu\n",
+	dprintk("--> %s ino %" PRIino "u pgbase %u req %zu@%llu\n",
 		__func__, hdr->inode->i_ino,
 		hdr->args.pgbase, (size_t)hdr->args.count, offset);
 
@@ -2245,7 +2245,7 @@ ff_layout_write_pagelist(struct nfs_pgio_header *hdr, int sync)
 
 	vers = nfs4_ff_layout_ds_version(mirror, dss_id);
 
-	dprintk("%s ino %lu sync %d req %zu@%llu DS: %s cl_count %d vers %d\n",
+	dprintk("%s ino %" PRIino "u sync %d req %zu@%llu DS: %s cl_count %d vers %d\n",
 		__func__, hdr->inode->i_ino, sync, (size_t) hdr->args.count,
 		offset, ds->ds_remotestr, refcount_read(&ds->ds_clp->cl_count),
 		vers);
@@ -2336,7 +2336,7 @@ static int ff_layout_initiate_commit(struct nfs_commit_data *data, int how)
 
 	vers = nfs4_ff_layout_ds_version(mirror, dss_id);
 
-	dprintk("%s ino %lu, how %d cl_count %d vers %d\n", __func__,
+	dprintk("%s ino %" PRIino "u, how %d cl_count %d vers %d\n", __func__,
 		data->inode->i_ino, how, refcount_read(&ds->ds_clp->cl_count),
 		vers);
 	data->commit_done_cb = ff_layout_commit_done_cb;
diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
index 4786343eeee0f874aa1f31ace2f35fdcb83fc7a6..81c2ab599e2f7a93c004219dcc52a5817b894cee 100644
--- a/fs/nfs/inode.c
+++ b/fs/nfs/inode.c
@@ -2258,7 +2258,7 @@ static int nfs_update_inode(struct inode *inode, struct nfs_fattr *fattr)
 	bool attr_changed = false;
 	bool have_delegation;
 
-	dfprintk(VFS, "NFS: %s(%s/%lu fh_crc=0x%08x ct=%d info=0x%llx)\n",
+	dfprintk(VFS, "NFS: %s(%s/%" PRIino "u fh_crc=0x%08x ct=%d info=0x%llx)\n",
 			__func__, inode->i_sb->s_id, inode->i_ino,
 			nfs_display_fhandle_hash(NFS_FH(inode)),
 			icount_read(inode), fattr->valid);
@@ -2288,7 +2288,7 @@ static int nfs_update_inode(struct inode *inode, struct nfs_fattr *fattr)
 		/*
 		* Big trouble! The inode has become a different object.
 		*/
-		printk(KERN_DEBUG "NFS: %s: inode %lu mode changed, %07o to %07o\n",
+		printk(KERN_DEBUG "NFS: %s: inode %" PRIino "u mode changed, %07o to %07o\n",
 				__func__, inode->i_ino, inode->i_mode, fattr->mode);
 		goto out_err;
 	}
@@ -2358,7 +2358,7 @@ static int nfs_update_inode(struct inode *inode, struct nfs_fattr *fattr)
 				if (S_ISDIR(inode->i_mode))
 					nfs_force_lookup_revalidate(inode);
 				attr_changed = true;
-				dprintk("NFS: change_attr change on server for file %s/%ld\n",
+				dprintk("NFS: change_attr change on server for file %s/%" PRIino "d\n",
 						inode->i_sb->s_id,
 						inode->i_ino);
 			} else if (!have_delegation) {
diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index 91bcf67bd743f72a008a9dcde29207bf7a36c407..f66683a6663e879e9b66de587abe0a6c471b68a0 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -4714,7 +4714,7 @@ static int _nfs4_proc_lookupp(struct inode *inode,
 	nfs_fattr_init(fattr);
 	nfs4_init_sequence(server->nfs_client, &args.seq_args, &res.seq_res, 0, 0);
 
-	dprintk("NFS call  lookupp ino=0x%lx\n", inode->i_ino);
+	dprintk("NFS call  lookupp ino=0x%" PRIino "x\n", inode->i_ino);
 	status = nfs4_do_call_sync(clnt, server, &msg, &args.seq_args,
 				   &res.seq_res, task_flags);
 	dprintk("NFS reply lookupp: %d\n", status);
@@ -10019,7 +10019,7 @@ nfs4_proc_layoutcommit(struct nfs4_layoutcommit_data *data, bool sync)
 	int status = 0;
 
 	dprintk("NFS: initiating layoutcommit call. sync %d "
-		"lbw: %llu inode %lu\n", sync,
+		"lbw: %llu inode %" PRIino "u\n", sync,
 		data->args.lastbytewritten,
 		data->args.inode->i_ino);
 
diff --git a/fs/nfs/pnfs.c b/fs/nfs/pnfs.c
index bc13d1e69449ce9bb3ed3ef0bbff06dfab5c60b5..9a335fc06c68e30c27c8b46ad0521026370449da 100644
--- a/fs/nfs/pnfs.c
+++ b/fs/nfs/pnfs.c
@@ -891,7 +891,7 @@ pnfs_layout_free_bulk_destroy_list(struct list_head *layout_list,
 	while (!list_empty(layout_list)) {
 		lo = list_entry(layout_list->next, struct pnfs_layout_hdr,
 				plh_bulk_destroy);
-		dprintk("%s freeing layout for inode %lu\n", __func__,
+		dprintk("%s freeing layout for inode %" PRIino "u\n", __func__,
 			lo->plh_inode->i_ino);
 		inode = lo->plh_inode;
 
@@ -1440,7 +1440,7 @@ _pnfs_return_layout(struct inode *ino)
 	int status = 0;
 	bool send, valid_layout;
 
-	dprintk("NFS: %s for inode %lu\n", __func__, ino->i_ino);
+	dprintk("NFS: %s for inode %" PRIino "u\n", __func__, ino->i_ino);
 
 	spin_lock(&ino->i_lock);
 	lo = nfsi->layout;
@@ -3055,7 +3055,7 @@ pnfs_try_to_write_data(struct nfs_pgio_header *hdr,
 
 	hdr->mds_ops = call_ops;
 
-	dprintk("%s: Writing ino:%lu %u@%llu (how %d)\n", __func__,
+	dprintk("%s: Writing ino:%" PRIino "u %u@%llu (how %d)\n", __func__,
 		inode->i_ino, hdr->args.count, hdr->args.offset, how);
 	trypnfs = nfss->pnfs_curr_ld->write_pagelist(hdr, how);
 	if (trypnfs != PNFS_NOT_ATTEMPTED)
@@ -3181,7 +3181,7 @@ pnfs_try_to_read_data(struct nfs_pgio_header *hdr,
 
 	hdr->mds_ops = call_ops;
 
-	dprintk("%s: Reading ino:%lu %u@%llu\n",
+	dprintk("%s: Reading ino:%" PRIino "u %u@%llu\n",
 		__func__, inode->i_ino, hdr->args.count, hdr->args.offset);
 
 	trypnfs = nfss->pnfs_curr_ld->read_pagelist(hdr);
@@ -3314,7 +3314,7 @@ pnfs_set_layoutcommit(struct inode *inode, struct pnfs_layout_segment *lseg,
 	if (!test_and_set_bit(NFS_INO_LAYOUTCOMMIT, &nfsi->flags)) {
 		nfsi->layout->plh_lwb = end_pos;
 		mark_as_dirty = true;
-		dprintk("%s: Set layoutcommit for inode %lu ",
+		dprintk("%s: Set layoutcommit for inode %" PRIino "u ",
 			__func__, inode->i_ino);
 	} else if (end_pos > nfsi->layout->plh_lwb)
 		nfsi->layout->plh_lwb = end_pos;
@@ -3363,7 +3363,7 @@ pnfs_layoutcommit_inode(struct inode *inode, bool sync)
 	if (!pnfs_layoutcommit_outstanding(inode))
 		return 0;
 
-	dprintk("--> %s inode %lu\n", __func__, inode->i_ino);
+	dprintk("--> %s inode %" PRIino "u\n", __func__, inode->i_ino);
 
 	status = -EAGAIN;
 	if (test_and_set_bit(NFS_INO_LAYOUTCOMMITTING, &nfsi->flags)) {

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
