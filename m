Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI0uOEdRqGnUtAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 16:35:35 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E951202DC8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 16:35:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7LktieH6Kh9WmesT1TianKZff6BdZGeO4qIAJMJzSU=; b=PGdeRyDIz9/4T1lKri6KOazGaw
	PuL9FRucel6pjWTW5w15u10IeZuzj5PkhbG9htO3s6Lv/yRXHaLhN5iHHbMgdpZQjotGp29XxkA+X
	3i+q6Ta+e/Knwf6GmZLTQI0qH4rzZqFB5VEAIcQFrCCwGL/vpwVF0BaxLUMwrBfoQnVE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxoG3-0003Ed-ND;
	Wed, 04 Mar 2026 15:35:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vxoFn-0003CK-03;
 Wed, 04 Mar 2026 15:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gVnUWQH7a1Gbi0lCyRvtnpPZOKtAbwU3ELoWFyvRbS0=; b=N4bLYUNp/jLNOtS2u+PRJD9khI
 JqAmqnEqLDHHSqGV4WUNgBzCpysqK2ypMEKwvNMpWf43cNKBXdEbI2iX59t/qjG3R4Ukc1zw15Cai
 wLWLjTILryLZjWJI2dnLXV24O9rROpTDcxk/MudCO+D3giyMWOZAW6zXZztMrgF8V9zU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gVnUWQH7a1Gbi0lCyRvtnpPZOKtAbwU3ELoWFyvRbS0=; b=dogVewpuQI0Y2J06yMNVAkjDXD
 3jldcTa6JGFjHU2jl6a/Bh+QPT4KSRU6nGoe5+masuKl+P0GFrtIuVyUzkn9lbEoMSF2/MxxEnHSl
 UeIiTkeUMJeX+f9oHHjlyeNrnXiphCZ99cQqpdR/zU7L9F/kEl/3ro6YD7WjBvLlF5XM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxoFe-00081A-Ik; Wed, 04 Mar 2026 15:35:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8FB056132D;
 Wed,  4 Mar 2026 15:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8107C4CEF7;
 Wed,  4 Mar 2026 15:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772638495;
 bh=pfzMsOYRRPF1Omutl9Wzsj/v4OymtZsNcWF1In5v5f8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tXE2Q9Ks2tkr375jZM52XmqFW0dn4JFmjuPn8LXDtk5D7XMH59EhbjF03E9DE4r2E
 gESzdIumn/zSP8x3m8O5EOhWEJ1PjI8sROJeijvBUq+G602kHEKVZxOS5WlJZNiWEf
 ysRfjxi9BHPmqmS9dLRKqgMNSjXWATww45sgbmyGGDO8n7XbN/jhFWZE+M0aWj3bvM
 s5t4TYxrzdFbuX+ueygZDOGwv3Mi1ZD4j1+PCFY+du7X0OBhU96G127FDCcjySRWvC
 WIc0YnB4HSCQEjbjImNyUaBw57icPjynkldyyExeBFZO1uf4X3S3rY5+5Y1qsIUtqm
 i6g8FzsZHvZJw==
Date: Wed, 04 Mar 2026 10:32:37 -0500
MIME-Version: 1.0
Message-Id: <20260304-iino-u64-v3-7-2257ad83d372@kernel.org>
References: <20260304-iino-u64-v3-0-2257ad83d372@kernel.org>
In-Reply-To: <20260304-iino-u64-v3-0-2257ad83d372@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dan Williams <dan.j.williams@intel.com>, Eric Biggers <ebiggers@kernel.org>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4105; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=pfzMsOYRRPF1Omutl9Wzsj/v4OymtZsNcWF1In5v5f8=;
 b=kA0DAAoBAA5oQRlWghUByyZiAGmoUKih/b5XA4c12kwIo+94gsSuVqUY2ifrVzx7MIWmY4czq
 4kCMwQAAQoAHRYhBEvA17JEcbKhhOr10wAOaEEZVoIVBQJpqFCoAAoJEAAOaEEZVoIVtqwQAI2c
 nH8OLzbicVfCcwgT7n9P6M7t4O0jSoWkDpkOnW5uYzqadeBA7vXo3g4BVSTLUJTJGhMeMweBvMu
 wH6JnBGvFz9DQEnzycO/ts0dx7ctK6deENDyfiOw9xFtL88u95GyKJjrYCaI/R03odStLCgqKrO
 QydS/H+pDQ2986UiMfvZTX4iAM5ryA/1uRe0l1r4DntVr8/+P+ybXJfTPyzlci6ZMeeghkP03xr
 oePUF31usdtfeIwplbBoulNZBxyw0y2oYwmJd5rsjUWZbJ8DbdA+l2uGiEtnmvVQn4dkIblbHe3
 V8aAH1URKwwhIL6G4fTGY0i1UBhoccOS6X+a+JjlUIcGlPfleEuFusJaHzOcZNFG3Gdw6QRGpoi
 1W2N4QxdTqf6p3nwR4YELtFb2nWku6JRQUDiaHFELUkJSvwulAEBKgsPG8/Ddz6j2WoG/hazUY8
 mq6O4ZWbELtD1YqMi1nHbULvdEFBnRs1ZsAPHj09vlo5lMcbOienETuTNJEt3UAmNRLrgL5Qae9
 BlADi29P9GjnWuXLT9mW6acwjHJcr9rQ77jl4t9e+pHXoDxfMf6RSgmbvxBkOkQRdcHa84Mfm6w
 Z427ySavl0tSQY8pC+9+ItSH4jPhpAqZXVEizDM6HQ6n1p6bYqMJRtxG85bUM9qJgduPP0ft2Fk
 oPpfe
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Update hugetlbfs trace event definitions to use u64 instead
 of ino_t/unsigned long for inode number fields. Signed-off-by: Jeff Layton
 <jlayton@kernel.org> --- include/trace/events/hugetlbfs.h | 42
 ++++++++++++++++++++
 1 file changed, 21 insertions(+), 21 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxoFe-00081A-Ik
Subject: [f2fs-dev] [PATCH v3 07/12] hugetlbfs: widen trace event i_ino
 fields to u64
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
X-Rspamd-Queue-Id: 1E951202DC8
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
	FREEMAIL_TO(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,goodmis.org,efficios.com,intel.com,mit.edu,linux.dev,suse.de,redhat.com,manguebit.org,dilger.ca,suse.com,oracle.com,brown.name,talpey.com,samba.org,gmail.com,microsoft.com,dubeyko.com,ionkov.net,codewreck.org,crudebyte.com,auristor.com,themaw.net,cs.cmu.edu,fluxnic.net,tyhicks.com,infradead.org,physik.fu-berlin.de,vivo.com,artax.karlin.mff.cuni.cz,nod.at,paragon-software.com,fasheh.com,evilplan.org,linux.alibaba.com,omnibond.com,szeredi.hu,alarsen.net,huawei.com,wdc.com,canonical.com,paul-moore.com,namei.org,hallyn.com,linux.ibm.com,schaufler-ca.com,amd.com,ffwll.ch,linaro.org,google.com,davemloft.net,arm.com,linux.intel.com,dev.tdt.de,yaina.de,holtmann.org,hartkopp.net,pengutronix.de,secunet.com,gondor.apana.org.au,fomichev.me,iogearbox.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[171];
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

Update hugetlbfs trace event definitions to use u64 instead of
ino_t/unsigned long for inode number fields.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 include/trace/events/hugetlbfs.h | 42 ++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/include/trace/events/hugetlbfs.h b/include/trace/events/hugetlbfs.h
index 59605dfaeeb43d9e7657e338fdbe740e8486a286..8ba72c1d4f4d8ba616906be5b5c4b487972fec00 100644
--- a/include/trace/events/hugetlbfs.h
+++ b/include/trace/events/hugetlbfs.h
@@ -14,9 +14,9 @@ TRACE_EVENT(hugetlbfs_alloc_inode,
 	TP_ARGS(inode, dir, mode),
 
 	TP_STRUCT__entry(
+		__field(u64,		ino)
+		__field(u64,		dir)
 		__field(dev_t,		dev)
-		__field(ino_t,		ino)
-		__field(ino_t,		dir)
 		__field(__u16,		mode)
 	),
 
@@ -27,10 +27,10 @@ TRACE_EVENT(hugetlbfs_alloc_inode,
 		__entry->mode		= mode;
 	),
 
-	TP_printk("dev %d,%d ino %lu dir %lu mode 0%o",
+	TP_printk("dev %d,%d ino %llu dir %llu mode 0%o",
 		MAJOR(__entry->dev), MINOR(__entry->dev),
-		(unsigned long) __entry->ino,
-		(unsigned long) __entry->dir, __entry->mode)
+		__entry->ino,
+		__entry->dir, __entry->mode)
 );
 
 DECLARE_EVENT_CLASS(hugetlbfs__inode,
@@ -40,13 +40,13 @@ DECLARE_EVENT_CLASS(hugetlbfs__inode,
 	TP_ARGS(inode),
 
 	TP_STRUCT__entry(
-		__field(dev_t,		dev)
-		__field(ino_t,		ino)
-		__field(__u16,		mode)
+		__field(u64,		ino)
 		__field(loff_t,		size)
+		__field(blkcnt_t,	blocks)
+		__field(dev_t,		dev)
 		__field(unsigned int,	nlink)
 		__field(unsigned int,	seals)
-		__field(blkcnt_t,	blocks)
+		__field(__u16,		mode)
 	),
 
 	TP_fast_assign(
@@ -59,8 +59,8 @@ DECLARE_EVENT_CLASS(hugetlbfs__inode,
 		__entry->blocks		= inode->i_blocks;
 	),
 
-	TP_printk("dev %d,%d ino %lu mode 0%o size %lld nlink %u seals %u blocks %llu",
-		MAJOR(__entry->dev), MINOR(__entry->dev), (unsigned long) __entry->ino,
+	TP_printk("dev %d,%d ino %llu mode 0%o size %lld nlink %u seals %u blocks %llu",
+		MAJOR(__entry->dev), MINOR(__entry->dev), __entry->ino,
 		__entry->mode, __entry->size, __entry->nlink, __entry->seals,
 		(unsigned long long)__entry->blocks)
 );
@@ -87,14 +87,14 @@ TRACE_EVENT(hugetlbfs_setattr,
 	TP_ARGS(inode, dentry, attr),
 
 	TP_STRUCT__entry(
+		__field(u64,		ino)
+		__field(loff_t,		old_size)
+		__field(loff_t,		ia_size)
 		__field(dev_t,		dev)
-		__field(ino_t,		ino)
 		__field(unsigned int,	d_len)
 		__string(d_name,	dentry->d_name.name)
 		__field(unsigned int,	ia_valid)
 		__field(unsigned int,	ia_mode)
-		__field(loff_t,		old_size)
-		__field(loff_t,		ia_size)
 	),
 
 	TP_fast_assign(
@@ -108,8 +108,8 @@ TRACE_EVENT(hugetlbfs_setattr,
 		__entry->ia_size	= attr->ia_size;
 	),
 
-	TP_printk("dev %d,%d ino %lu name %.*s valid %#x mode 0%o old_size %lld size %lld",
-		MAJOR(__entry->dev), MINOR(__entry->dev), (unsigned long)__entry->ino,
+	TP_printk("dev %d,%d ino %llu name %.*s valid %#x mode 0%o old_size %lld size %lld",
+		MAJOR(__entry->dev), MINOR(__entry->dev), __entry->ino,
 		__entry->d_len, __get_str(d_name), __entry->ia_valid, __entry->ia_mode,
 		__entry->old_size, __entry->ia_size)
 );
@@ -122,12 +122,12 @@ TRACE_EVENT(hugetlbfs_fallocate,
 	TP_ARGS(inode, mode, offset, len, ret),
 
 	TP_STRUCT__entry(
-		__field(dev_t,		dev)
-		__field(ino_t,		ino)
-		__field(int,		mode)
+		__field(u64,		ino)
 		__field(loff_t,		offset)
 		__field(loff_t,		len)
 		__field(loff_t,		size)
+		__field(dev_t,		dev)
+		__field(int,		mode)
 		__field(int,		ret)
 	),
 
@@ -141,9 +141,9 @@ TRACE_EVENT(hugetlbfs_fallocate,
 		__entry->ret		= ret;
 	),
 
-	TP_printk("dev %d,%d ino %lu mode 0%o offset %lld len %lld size %lld ret %d",
+	TP_printk("dev %d,%d ino %llu mode 0%o offset %lld len %lld size %lld ret %d",
 		MAJOR(__entry->dev), MINOR(__entry->dev),
-		(unsigned long)__entry->ino, __entry->mode,
+		__entry->ino, __entry->mode,
 		(unsigned long long)__entry->offset,
 		(unsigned long long)__entry->len,
 		(unsigned long long)__entry->size,

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
