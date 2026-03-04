Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBJIGlJRqGmztAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 16:35:46 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BED7202DDA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 16:35:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3hnOa5P3AKaSTCvMkxL71FrMgJlkdJyPK9fgZ7yj+U=; b=huOIkaGx7fRV90UkY2aRiJuq9X
	2OllXFMfRpWMObPmTzvLEDxMCWM/NOWi2ivMmGK0RUpB0wFW6qTQS0ObvJPZfO1bpPcsBBriMRJQr
	IDiITW/9UuwofnpWz7keqDQkWLRl2FRAcn4FFSFWHKcpPsdwmIxLA9le9d9KeKAAHQNo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxoGE-0008TZ-VB;
	Wed, 04 Mar 2026 15:35:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vxoGD-0008TN-A2;
 Wed, 04 Mar 2026 15:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0ySjXjLDVgEfrmo73EIIV5iviup9vXfmVbsbkb24Pn4=; b=gAQBO+h4atOWI4Dhxjkn1P+Ffl
 pguvqs32577aLCPVdM7c0/JALNqC4KUDPL2Kg8Pg2ajuPVgiZfsetpL/ZkG2biS2OsSpNX7Dqn3lq
 RrecfhkNpId1gHJYN53a0JnzgC4Gl9uZbhNSJ1sla2MlSyFogyeBtg/iXSF0T84J3bFI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0ySjXjLDVgEfrmo73EIIV5iviup9vXfmVbsbkb24Pn4=; b=SU/tTqoA9EkfUUUGxd2i1BSSfr
 A9dO5c0EwGKoh3rVMdBsJmuatDF734Oqc7dZGNkMwyL/Agi80iikAjuKWvkKKB+fFsAiT6QaWIL39
 B/p4TjRXX86ZURK4drZCDZySO+p+ShvUV6c0p8i8RpYf9ntXeWQLj7LEq+Fj3JJdwQu8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxoG8-00083K-HC; Wed, 04 Mar 2026 15:35:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 046E761337;
 Wed,  4 Mar 2026 15:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F4A4C4CEF7;
 Wed,  4 Mar 2026 15:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772638524;
 bh=RF5iyehwvSkRRzEjyicBKZrLO+aDvhjncwrQG25v2Wc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=IcJwUy6kJRZfG8GXcFXlbKenDhZgdynIzYzRZZxfdOg5Qwqmb7KPpHf681yuWc9s7
 k5WWEGp5e2twBv1FNFpc0mSxj/lhKm8xNZsHWV6bEmQP3rIjaM6rqI1XguFsffX1Z2
 TMqAeg3qgGtJpQTErXzBAF8mWg8+Zf7jBmr84bkhnVp820uZ4gGIMD290TKkgF1yim
 RV7yj4v8M7Siiq8SgGQoOyUg6/sAhY5W/JvHiRrSGWi/ICphfziUCWMi8qSuYO1JZ5
 JLhnrbd9ER+BHUth+E1Y8G1oJvLVLnVbnFC+I4zBZIvynZcZFuz5v67O6fZKkbNfm+
 WJ6lcQMaSKqaw==
Date: Wed, 04 Mar 2026 10:32:39 -0500
MIME-Version: 1.0
Message-Id: <20260304-iino-u64-v3-9-2257ad83d372@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=53765; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=RF5iyehwvSkRRzEjyicBKZrLO+aDvhjncwrQG25v2Wc=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpqFCo9fJmPDY1KBqEXyisBtEAM5N4ZploxfSm4
 lcbZNwyIRqJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaahQqAAKCRAADmhBGVaC
 FXKUEACvUr7X1Hv8nEvTPyPj3hSDCESTPQAX2iIwHWO0AQQw7B+HkHRpK0iEZN0+kLfi7//hqkR
 skrz/ltS/qHHXFG133FH6TWcBreWPVGoUybcde7bl3lNxOIP2a1chKRA7mrPBDDDcKANLQ8c3AF
 7YkHUHZLzZpYRJHpVWQOCedYKjStbkDEfFrlss19a/+dgJHWqCJ+9zrNZ9MI5aibW1KT/j0FC2Y
 VWPlKqaN3QqI5hVVXJG5ZcQVXaO8x1LMLQCdrORuXuu+3k46R7myHJJBudh252QnHehpJfW4sy7
 gp8OaHQITdWCQ9MV7NoF+opi39f6MLdGUdIBisosC8g1pRtj0mA++9KuvT5NaKJwWQTzbIBWxrT
 J9ut2KMlhA9Fsk7FyCh1G1QPNde/WLLboeChZwp2Nt/cIenlk+sDrHff8e/NjUvleZYQtiHmC5d
 NdXM64hQ7Ze23gqRq5wkMYLAmxqzFHN/pnuKxEEln+w/wvSt1Z/BIaVZwjqnKhnS0g0kctXF190
 jZcUuRtuV3ieTFW+X+i20e2buFDsAHjW2YCbkSm8ogUaQwF9j+Qy5Fy9fc1n96RTNrJ8IuCUEk4
 xZkw+uhhmaNCDP9JutQfa6gIxG/3ExtYmUTL9MRi+3MmW8O5eb3Ffy2//OJ8+wUdd+RUZmFoq7O
 jWwJuwkpZzRP5mg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In trace events, change __field(ino_t, ...) to __field(u64, 
 ...) and update TP_printk format strings to %llu/%llx to match the widened
 field type. Reviewed-by: Jan Kara <jack@suse.cz> Signed-off-by: Jeff Layton
 <jlayton@kernel.org> --- include/trace/events/ext4.h | 544
 ++++++++++++++++++++++ 1 file changed, 272 insertions(+ [...] 
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
X-Headers-End: 1vxoG8-00083K-HC
Subject: [f2fs-dev] [PATCH v3 09/12] ext4: widen trace event i_ino fields to
 u64
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
X-Rspamd-Queue-Id: 3BED7202DDA
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
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,suse.cz:email]
X-Rspamd-Action: no action

In trace events, change __field(ino_t, ...) to __field(u64, ...)
and update TP_printk format strings to %llu/%llx to match the
widened field type.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 include/trace/events/ext4.h | 544 ++++++++++++++++++++++----------------------
 1 file changed, 272 insertions(+), 272 deletions(-)

diff --git a/include/trace/events/ext4.h b/include/trace/events/ext4.h
index a3e8fe414df85c53e8aa15836ab93c3ae514c815..84ef091af2d340607987b3306523eee7b6643a17 100644
--- a/include/trace/events/ext4.h
+++ b/include/trace/events/ext4.h
@@ -138,14 +138,14 @@ TRACE_DEFINE_ENUM(CR_ANY_FREE);
 			 { CR_ANY_FREE, "CR_ANY_FREE" })
 
 TRACE_EVENT(ext4_other_inode_update_time,
-	TP_PROTO(struct inode *inode, ino_t orig_ino),
+	TP_PROTO(struct inode *inode, u64 orig_ino),
 
 	TP_ARGS(inode, orig_ino),
 
 	TP_STRUCT__entry(
+		__field(	u64,	ino			)
+		__field(	u64,	orig_ino		)
 		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
-		__field(	ino_t,	orig_ino		)
 		__field(	uid_t,	uid			)
 		__field(	gid_t,	gid			)
 		__field(	__u16, mode			)
@@ -160,10 +160,10 @@ TRACE_EVENT(ext4_other_inode_update_time,
 		__entry->mode	= inode->i_mode;
 	),
 
-	TP_printk("dev %d,%d orig_ino %lu ino %lu mode 0%o uid %u gid %u",
+	TP_printk("dev %d,%d orig_ino %llu ino %llu mode 0%o uid %u gid %u",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->orig_ino,
-		  (unsigned long) __entry->ino, __entry->mode,
+		  __entry->orig_ino,
+		  __entry->ino, __entry->mode,
 		  __entry->uid, __entry->gid)
 );
 
@@ -173,11 +173,11 @@ TRACE_EVENT(ext4_free_inode,
 	TP_ARGS(inode),
 
 	TP_STRUCT__entry(
+		__field(	u64,	ino			)
+		__field(	__u64, blocks			)
 		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
 		__field(	uid_t,	uid			)
 		__field(	gid_t,	gid			)
-		__field(	__u64, blocks			)
 		__field(	__u16, mode			)
 	),
 
@@ -190,9 +190,9 @@ TRACE_EVENT(ext4_free_inode,
 		__entry->mode	= inode->i_mode;
 	),
 
-	TP_printk("dev %d,%d ino %lu mode 0%o uid %u gid %u blocks %llu",
+	TP_printk("dev %d,%d ino %llu mode 0%o uid %u gid %u blocks %llu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino, __entry->mode,
+		  __entry->ino, __entry->mode,
 		  __entry->uid, __entry->gid, __entry->blocks)
 );
 
@@ -202,8 +202,8 @@ TRACE_EVENT(ext4_request_inode,
 	TP_ARGS(dir, mode),
 
 	TP_STRUCT__entry(
+		__field(	u64,	dir			)
 		__field(	dev_t,	dev			)
-		__field(	ino_t,	dir			)
 		__field(	__u16, mode			)
 	),
 
@@ -213,9 +213,9 @@ TRACE_EVENT(ext4_request_inode,
 		__entry->mode	= mode;
 	),
 
-	TP_printk("dev %d,%d dir %lu mode 0%o",
+	TP_printk("dev %d,%d dir %llu mode 0%o",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->dir, __entry->mode)
+		  __entry->dir, __entry->mode)
 );
 
 TRACE_EVENT(ext4_allocate_inode,
@@ -224,9 +224,9 @@ TRACE_EVENT(ext4_allocate_inode,
 	TP_ARGS(inode, dir, mode),
 
 	TP_STRUCT__entry(
+		__field(	u64,	ino			)
+		__field(	u64,	dir			)
 		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
-		__field(	ino_t,	dir			)
 		__field(	__u16,	mode			)
 	),
 
@@ -237,10 +237,10 @@ TRACE_EVENT(ext4_allocate_inode,
 		__entry->mode	= mode;
 	),
 
-	TP_printk("dev %d,%d ino %lu dir %lu mode 0%o",
+	TP_printk("dev %d,%d ino %llu dir %llu mode 0%o",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
-		  (unsigned long) __entry->dir, __entry->mode)
+		  __entry->ino,
+		  __entry->dir, __entry->mode)
 );
 
 TRACE_EVENT(ext4_evict_inode,
@@ -249,8 +249,8 @@ TRACE_EVENT(ext4_evict_inode,
 	TP_ARGS(inode),
 
 	TP_STRUCT__entry(
+		__field(	u64,	ino			)
 		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
 		__field(	int,	nlink			)
 	),
 
@@ -260,9 +260,9 @@ TRACE_EVENT(ext4_evict_inode,
 		__entry->nlink	= inode->i_nlink;
 	),
 
-	TP_printk("dev %d,%d ino %lu nlink %d",
+	TP_printk("dev %d,%d ino %llu nlink %d",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino, __entry->nlink)
+		  __entry->ino, __entry->nlink)
 );
 
 TRACE_EVENT(ext4_drop_inode,
@@ -271,8 +271,8 @@ TRACE_EVENT(ext4_drop_inode,
 	TP_ARGS(inode, drop),
 
 	TP_STRUCT__entry(
+		__field(	u64,	ino			)
 		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
 		__field(	int,	drop			)
 	),
 
@@ -282,9 +282,9 @@ TRACE_EVENT(ext4_drop_inode,
 		__entry->drop	= drop;
 	),
 
-	TP_printk("dev %d,%d ino %lu drop %d",
+	TP_printk("dev %d,%d ino %llu drop %d",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino, __entry->drop)
+		  __entry->ino, __entry->drop)
 );
 
 TRACE_EVENT(ext4_nfs_commit_metadata,
@@ -293,8 +293,8 @@ TRACE_EVENT(ext4_nfs_commit_metadata,
 	TP_ARGS(inode),
 
 	TP_STRUCT__entry(
+		__field(	u64,	ino			)
 		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
 	),
 
 	TP_fast_assign(
@@ -302,9 +302,9 @@ TRACE_EVENT(ext4_nfs_commit_metadata,
 		__entry->ino	= inode->i_ino;
 	),
 
-	TP_printk("dev %d,%d ino %lu",
+	TP_printk("dev %d,%d ino %llu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino)
+		  __entry->ino)
 );
 
 TRACE_EVENT(ext4_mark_inode_dirty,
@@ -313,9 +313,9 @@ TRACE_EVENT(ext4_mark_inode_dirty,
 	TP_ARGS(inode, IP),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(unsigned long,	ip			)
+		__field(	dev_t,	dev			)
 	),
 
 	TP_fast_assign(
@@ -324,9 +324,9 @@ TRACE_EVENT(ext4_mark_inode_dirty,
 		__entry->ip	= IP;
 	),
 
-	TP_printk("dev %d,%d ino %lu caller %pS",
+	TP_printk("dev %d,%d ino %llu caller %pS",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino, (void *)__entry->ip)
+		  __entry->ino, (void *)__entry->ip)
 );
 
 TRACE_EVENT(ext4_begin_ordered_truncate,
@@ -335,9 +335,9 @@ TRACE_EVENT(ext4_begin_ordered_truncate,
 	TP_ARGS(inode, new_size),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(	loff_t,	new_size		)
+		__field(	dev_t,	dev			)
 	),
 
 	TP_fast_assign(
@@ -346,9 +346,9 @@ TRACE_EVENT(ext4_begin_ordered_truncate,
 		__entry->new_size	= new_size;
 	),
 
-	TP_printk("dev %d,%d ino %lu new_size %lld",
+	TP_printk("dev %d,%d ino %llu new_size %lld",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->new_size)
 );
 
@@ -359,9 +359,9 @@ DECLARE_EVENT_CLASS(ext4__write_begin,
 	TP_ARGS(inode, pos, len),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(	loff_t,	pos			)
+		__field(	dev_t,	dev			)
 		__field(	unsigned int, len		)
 	),
 
@@ -372,9 +372,9 @@ DECLARE_EVENT_CLASS(ext4__write_begin,
 		__entry->len	= len;
 	),
 
-	TP_printk("dev %d,%d ino %lu pos %lld len %u",
+	TP_printk("dev %d,%d ino %llu pos %lld len %u",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->pos, __entry->len)
 );
 
@@ -399,9 +399,9 @@ DECLARE_EVENT_CLASS(ext4__write_end,
 	TP_ARGS(inode, pos, len, copied),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(	loff_t,	pos			)
+		__field(	dev_t,	dev			)
 		__field(	unsigned int, len		)
 		__field(	unsigned int, copied		)
 	),
@@ -414,9 +414,9 @@ DECLARE_EVENT_CLASS(ext4__write_end,
 		__entry->copied	= copied;
 	),
 
-	TP_printk("dev %d,%d ino %lu pos %lld len %u copied %u",
+	TP_printk("dev %d,%d ino %llu pos %lld len %u copied %u",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->pos, __entry->len, __entry->copied)
 );
 
@@ -450,13 +450,13 @@ TRACE_EVENT(ext4_writepages,
 	TP_ARGS(inode, wbc),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
-		__field(	long,	nr_to_write		)
-		__field(	long,	pages_skipped		)
+		__field(	u64,	ino			)
 		__field(	loff_t,	range_start		)
 		__field(	loff_t,	range_end		)
+		__field(	long,	nr_to_write		)
+		__field(	long,	pages_skipped		)
 		__field(       pgoff_t,	writeback_index		)
+		__field(	dev_t,	dev			)
 		__field(	int,	sync_mode		)
 		__field(	char,	for_kupdate		)
 		__field(	char,	range_cyclic		)
@@ -475,11 +475,11 @@ TRACE_EVENT(ext4_writepages,
 		__entry->range_cyclic	= wbc->range_cyclic;
 	),
 
-	TP_printk("dev %d,%d ino %lu nr_to_write %ld pages_skipped %ld "
+	TP_printk("dev %d,%d ino %llu nr_to_write %ld pages_skipped %ld "
 		  "range_start %lld range_end %lld sync_mode %d "
 		  "for_kupdate %d range_cyclic %d writeback_index %lu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino, __entry->nr_to_write,
+		  __entry->ino, __entry->nr_to_write,
 		  __entry->pages_skipped, __entry->range_start,
 		  __entry->range_end, __entry->sync_mode,
 		  __entry->for_kupdate, __entry->range_cyclic,
@@ -493,11 +493,11 @@ TRACE_EVENT(ext4_da_write_folios_start,
 	TP_ARGS(inode, start_pos, next_pos, wbc),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(       loff_t,	start_pos		)
 		__field(       loff_t,	next_pos		)
 		__field(	 long,	nr_to_write		)
+		__field(	dev_t,	dev			)
 		__field(	  int,	sync_mode		)
 	),
 
@@ -510,9 +510,9 @@ TRACE_EVENT(ext4_da_write_folios_start,
 		__entry->sync_mode	= wbc->sync_mode;
 	),
 
-	TP_printk("dev %d,%d ino %lu start_pos 0x%llx next_pos 0x%llx nr_to_write %ld sync_mode %d",
+	TP_printk("dev %d,%d ino %llu start_pos 0x%llx next_pos 0x%llx nr_to_write %ld sync_mode %d",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino, __entry->start_pos, __entry->next_pos,
+		  __entry->ino, __entry->start_pos, __entry->next_pos,
 		  __entry->nr_to_write, __entry->sync_mode)
 );
 
@@ -523,11 +523,11 @@ TRACE_EVENT(ext4_da_write_folios_end,
 	TP_ARGS(inode, start_pos, next_pos, wbc, ret),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(       loff_t,	start_pos		)
 		__field(       loff_t,	next_pos		)
 		__field(	 long,	nr_to_write		)
+		__field(	dev_t,	dev			)
 		__field(	  int,	ret			)
 	),
 
@@ -540,9 +540,9 @@ TRACE_EVENT(ext4_da_write_folios_end,
 		__entry->ret		= ret;
 	),
 
-	TP_printk("dev %d,%d ino %lu start_pos 0x%llx next_pos 0x%llx nr_to_write %ld ret %d",
+	TP_printk("dev %d,%d ino %llu start_pos 0x%llx next_pos 0x%llx nr_to_write %ld ret %d",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino, __entry->start_pos, __entry->next_pos,
+		  __entry->ino, __entry->start_pos, __entry->next_pos,
 		  __entry->nr_to_write, __entry->ret)
 );
 
@@ -552,9 +552,9 @@ TRACE_EVENT(ext4_da_write_pages_extent,
 	TP_ARGS(inode, map),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(	__u64,	lblk			)
+		__field(	dev_t,	dev			)
 		__field(	__u32,	len			)
 		__field(	__u32,	flags			)
 	),
@@ -567,9 +567,9 @@ TRACE_EVENT(ext4_da_write_pages_extent,
 		__entry->flags		= map->m_flags;
 	),
 
-	TP_printk("dev %d,%d ino %lu lblk %llu len %u flags %s",
+	TP_printk("dev %d,%d ino %llu lblk %llu len %u flags %s",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino, __entry->lblk, __entry->len,
+		  __entry->ino, __entry->lblk, __entry->len,
 		  show_mflags(__entry->flags))
 );
 
@@ -580,12 +580,12 @@ TRACE_EVENT(ext4_writepages_result,
 	TP_ARGS(inode, wbc, ret, pages_written),
 
 	TP_STRUCT__entry(
+		__field(	u64,	ino			)
+		__field(	long,	pages_skipped		)
+		__field(       pgoff_t,	writeback_index		)
 		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
 		__field(	int,	ret			)
 		__field(	int,	pages_written		)
-		__field(	long,	pages_skipped		)
-		__field(       pgoff_t,	writeback_index		)
 		__field(	int,	sync_mode		)
 	),
 
@@ -599,10 +599,10 @@ TRACE_EVENT(ext4_writepages_result,
 		__entry->sync_mode	= wbc->sync_mode;
 	),
 
-	TP_printk("dev %d,%d ino %lu ret %d pages_written %d pages_skipped %ld "
+	TP_printk("dev %d,%d ino %llu ret %d pages_written %d pages_skipped %ld "
 		  "sync_mode %d writeback_index %lu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino, __entry->ret,
+		  __entry->ino, __entry->ret,
 		  __entry->pages_written, __entry->pages_skipped,
 		  __entry->sync_mode,
 		  (unsigned long) __entry->writeback_index)
@@ -614,9 +614,9 @@ DECLARE_EVENT_CLASS(ext4__folio_op,
 	TP_ARGS(inode, folio),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(	pgoff_t, index			)
+		__field(	dev_t,	dev			)
 
 	),
 
@@ -626,9 +626,9 @@ DECLARE_EVENT_CLASS(ext4__folio_op,
 		__entry->index	= folio->index;
 	),
 
-	TP_printk("dev %d,%d ino %lu folio_index %lu",
+	TP_printk("dev %d,%d ino %llu folio_index %lu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  (unsigned long) __entry->index)
 );
 
@@ -652,11 +652,11 @@ DECLARE_EVENT_CLASS(ext4_invalidate_folio_op,
 	TP_ARGS(folio, offset, length),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(	pgoff_t, index			)
 		__field(	size_t, offset			)
 		__field(	size_t, length			)
+		__field(	dev_t,	dev			)
 	),
 
 	TP_fast_assign(
@@ -667,9 +667,9 @@ DECLARE_EVENT_CLASS(ext4_invalidate_folio_op,
 		__entry->length	= length;
 	),
 
-	TP_printk("dev %d,%d ino %lu folio_index %lu offset %zu length %zu",
+	TP_printk("dev %d,%d ino %llu folio_index %lu offset %zu length %zu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  (unsigned long) __entry->index,
 		  __entry->offset, __entry->length)
 );
@@ -717,10 +717,10 @@ DECLARE_EVENT_CLASS(ext4__mb_new_pa,
 	TP_ARGS(ac, pa),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(	__u64,	pa_pstart		)
 		__field(	__u64,	pa_lstart		)
+		__field(	dev_t,	dev			)
 		__field(	__u32,	pa_len			)
 
 	),
@@ -733,9 +733,9 @@ DECLARE_EVENT_CLASS(ext4__mb_new_pa,
 		__entry->pa_len		= pa->pa_len;
 	),
 
-	TP_printk("dev %d,%d ino %lu pstart %llu len %u lstart %llu",
+	TP_printk("dev %d,%d ino %llu pstart %llu len %u lstart %llu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->pa_pstart, __entry->pa_len, __entry->pa_lstart)
 );
 
@@ -762,9 +762,9 @@ TRACE_EVENT(ext4_mb_release_inode_pa,
 	TP_ARGS(pa, block, count),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(	__u64,	block			)
+		__field(	dev_t,	dev			)
 		__field(	__u32,	count			)
 
 	),
@@ -776,9 +776,9 @@ TRACE_EVENT(ext4_mb_release_inode_pa,
 		__entry->count		= count;
 	),
 
-	TP_printk("dev %d,%d ino %lu block %llu count %u",
+	TP_printk("dev %d,%d ino %llu block %llu count %u",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->block, __entry->count)
 );
 
@@ -811,8 +811,8 @@ TRACE_EVENT(ext4_discard_preallocations,
 	TP_ARGS(inode, len),
 
 	TP_STRUCT__entry(
+		__field(	u64,		ino		)
 		__field(	dev_t,		dev		)
-		__field(	ino_t,		ino		)
 		__field(	unsigned int,	len		)
 
 	),
@@ -823,9 +823,9 @@ TRACE_EVENT(ext4_discard_preallocations,
 		__entry->len	= len;
 	),
 
-	TP_printk("dev %d,%d ino %lu len: %u",
+	TP_printk("dev %d,%d ino %llu len: %u",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino, __entry->len)
+		  __entry->ino, __entry->len)
 );
 
 TRACE_EVENT(ext4_mb_discard_preallocations,
@@ -855,15 +855,15 @@ TRACE_EVENT(ext4_request_blocks,
 	TP_ARGS(ar),
 
 	TP_STRUCT__entry(
+		__field(	u64,	ino			)
+		__field(	__u64,	goal			)
+		__field(	__u64,	pleft			)
+		__field(	__u64,	pright			)
 		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
 		__field(	unsigned int, len		)
 		__field(	__u32,  logical			)
 		__field(	__u32,	lleft			)
 		__field(	__u32,	lright			)
-		__field(	__u64,	goal			)
-		__field(	__u64,	pleft			)
-		__field(	__u64,	pright			)
 		__field(	unsigned int, flags		)
 	),
 
@@ -880,10 +880,10 @@ TRACE_EVENT(ext4_request_blocks,
 		__entry->flags	= ar->flags;
 	),
 
-	TP_printk("dev %d,%d ino %lu flags %s len %u lblk %u goal %llu "
+	TP_printk("dev %d,%d ino %llu flags %s len %u lblk %u goal %llu "
 		  "lleft %u lright %u pleft %llu pright %llu ",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino, show_mballoc_flags(__entry->flags),
+		  __entry->ino, show_mballoc_flags(__entry->flags),
 		  __entry->len, __entry->logical, __entry->goal,
 		  __entry->lleft, __entry->lright, __entry->pleft,
 		  __entry->pright)
@@ -895,16 +895,16 @@ TRACE_EVENT(ext4_allocate_blocks,
 	TP_ARGS(ar, block),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(	__u64,	block			)
+		__field(	__u64,	goal			)
+		__field(	__u64,	pleft			)
+		__field(	__u64,	pright			)
+		__field(	dev_t,	dev			)
 		__field(	unsigned int, len		)
 		__field(	__u32,  logical			)
 		__field(	__u32,	lleft			)
 		__field(	__u32,	lright			)
-		__field(	__u64,	goal			)
-		__field(	__u64,	pleft			)
-		__field(	__u64,	pright			)
 		__field(	unsigned int, flags		)
 	),
 
@@ -922,10 +922,10 @@ TRACE_EVENT(ext4_allocate_blocks,
 		__entry->flags	= ar->flags;
 	),
 
-	TP_printk("dev %d,%d ino %lu flags %s len %u block %llu lblk %u "
+	TP_printk("dev %d,%d ino %llu flags %s len %u block %llu lblk %u "
 		  "goal %llu lleft %u lright %u pleft %llu pright %llu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino, show_mballoc_flags(__entry->flags),
+		  __entry->ino, show_mballoc_flags(__entry->flags),
 		  __entry->len, __entry->block, __entry->logical,
 		  __entry->goal,  __entry->lleft, __entry->lright,
 		  __entry->pleft, __entry->pright)
@@ -938,10 +938,10 @@ TRACE_EVENT(ext4_free_blocks,
 	TP_ARGS(inode, block, count, flags),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(	__u64,	block			)
 		__field(	unsigned long,	count		)
+		__field(	dev_t,	dev			)
 		__field(	int,	flags			)
 		__field(	__u16,	mode			)
 	),
@@ -955,9 +955,9 @@ TRACE_EVENT(ext4_free_blocks,
 		__entry->mode		= inode->i_mode;
 	),
 
-	TP_printk("dev %d,%d ino %lu mode 0%o block %llu count %lu flags %s",
+	TP_printk("dev %d,%d ino %llu mode 0%o block %llu count %lu flags %s",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->mode, __entry->block, __entry->count,
 		  show_free_flags(__entry->flags))
 );
@@ -968,9 +968,9 @@ TRACE_EVENT(ext4_sync_file_enter,
 	TP_ARGS(file, datasync),
 
 	TP_STRUCT__entry(
+		__field(	u64,	ino			)
+		__field(	u64,	parent			)
 		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
-		__field(	ino_t,	parent			)
 		__field(	int,	datasync		)
 	),
 
@@ -983,10 +983,10 @@ TRACE_EVENT(ext4_sync_file_enter,
 		__entry->parent		= d_inode(dentry->d_parent)->i_ino;
 	),
 
-	TP_printk("dev %d,%d ino %lu parent %lu datasync %d ",
+	TP_printk("dev %d,%d ino %llu parent %llu datasync %d ",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
-		  (unsigned long) __entry->parent, __entry->datasync)
+		  __entry->ino,
+		  __entry->parent, __entry->datasync)
 );
 
 TRACE_EVENT(ext4_sync_file_exit,
@@ -995,8 +995,8 @@ TRACE_EVENT(ext4_sync_file_exit,
 	TP_ARGS(inode, ret),
 
 	TP_STRUCT__entry(
+		__field(	u64,	ino			)
 		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
 		__field(	int,	ret			)
 	),
 
@@ -1006,9 +1006,9 @@ TRACE_EVENT(ext4_sync_file_exit,
 		__entry->ret		= ret;
 	),
 
-	TP_printk("dev %d,%d ino %lu ret %d",
+	TP_printk("dev %d,%d ino %llu ret %d",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->ret)
 );
 
@@ -1039,8 +1039,8 @@ TRACE_EVENT(ext4_alloc_da_blocks,
 	TP_ARGS(inode),
 
 	TP_STRUCT__entry(
+		__field(	u64,	ino			)
 		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
 		__field( unsigned int,	data_blocks		)
 	),
 
@@ -1050,9 +1050,9 @@ TRACE_EVENT(ext4_alloc_da_blocks,
 		__entry->data_blocks = EXT4_I(inode)->i_reserved_data_blocks;
 	),
 
-	TP_printk("dev %d,%d ino %lu reserved_data_blocks %u",
+	TP_printk("dev %d,%d ino %llu reserved_data_blocks %u",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->data_blocks)
 );
 
@@ -1062,8 +1062,8 @@ TRACE_EVENT(ext4_mballoc_alloc,
 	TP_ARGS(ac),
 
 	TP_STRUCT__entry(
+		__field(	u64,	ino			)
 		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
 		__field(	__u32, 	orig_logical		)
 		__field(	  int,	orig_start		)
 		__field(	__u32, 	orig_group		)
@@ -1107,11 +1107,11 @@ TRACE_EVENT(ext4_mballoc_alloc,
 		__entry->cr		= ac->ac_criteria;
 	),
 
-	TP_printk("dev %d,%d inode %lu orig %u/%d/%u@%u goal %u/%d/%u@%u "
+	TP_printk("dev %d,%d inode %llu orig %u/%d/%u@%u goal %u/%d/%u@%u "
 		  "result %u/%d/%u@%u blks %u grps %u cr %s flags %s "
 		  "tail %u broken %u",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->orig_group, __entry->orig_start,
 		  __entry->orig_len, __entry->orig_logical,
 		  __entry->goal_group, __entry->goal_start,
@@ -1129,8 +1129,8 @@ TRACE_EVENT(ext4_mballoc_prealloc,
 	TP_ARGS(ac),
 
 	TP_STRUCT__entry(
+		__field(	u64,	ino			)
 		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
 		__field(	__u32, 	orig_logical		)
 		__field(	  int,	orig_start		)
 		__field(	__u32, 	orig_group		)
@@ -1154,9 +1154,9 @@ TRACE_EVENT(ext4_mballoc_prealloc,
 		__entry->result_len	= ac->ac_b_ex.fe_len;
 	),
 
-	TP_printk("dev %d,%d inode %lu orig %u/%d/%u@%u result %u/%d/%u@%u",
+	TP_printk("dev %d,%d inode %llu orig %u/%d/%u@%u result %u/%d/%u@%u",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->orig_group, __entry->orig_start,
 		  __entry->orig_len, __entry->orig_logical,
 		  __entry->result_group, __entry->result_start,
@@ -1173,8 +1173,8 @@ DECLARE_EVENT_CLASS(ext4__mballoc,
 	TP_ARGS(sb, inode, group, start, len),
 
 	TP_STRUCT__entry(
+		__field(	u64,	ino			)
 		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
 		__field(	  int,	result_start		)
 		__field(	__u32, 	result_group		)
 		__field(	  int,	result_len		)
@@ -1188,9 +1188,9 @@ DECLARE_EVENT_CLASS(ext4__mballoc,
 		__entry->result_len	= len;
 	),
 
-	TP_printk("dev %d,%d inode %lu extent %u/%d/%d ",
+	TP_printk("dev %d,%d inode %llu extent %u/%d/%d ",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->result_group, __entry->result_start,
 		  __entry->result_len)
 );
@@ -1223,9 +1223,9 @@ TRACE_EVENT(ext4_forget,
 	TP_ARGS(inode, is_metadata, block),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(	__u64,	block			)
+		__field(	dev_t,	dev			)
 		__field(	int,	is_metadata		)
 		__field(	__u16,	mode			)
 	),
@@ -1238,9 +1238,9 @@ TRACE_EVENT(ext4_forget,
 		__entry->mode	= inode->i_mode;
 	),
 
-	TP_printk("dev %d,%d ino %lu mode 0%o is_metadata %d block %llu",
+	TP_printk("dev %d,%d ino %llu mode 0%o is_metadata %d block %llu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->mode, __entry->is_metadata, __entry->block)
 );
 
@@ -1250,9 +1250,9 @@ TRACE_EVENT(ext4_da_update_reserve_space,
 	TP_ARGS(inode, used_blocks, quota_claim),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(	__u64,	i_blocks		)
+		__field(	dev_t,	dev			)
 		__field(	int,	used_blocks		)
 		__field(	int,	reserved_data_blocks	)
 		__field(	int,	quota_claim		)
@@ -1270,10 +1270,10 @@ TRACE_EVENT(ext4_da_update_reserve_space,
 		__entry->mode	= inode->i_mode;
 	),
 
-	TP_printk("dev %d,%d ino %lu mode 0%o i_blocks %llu used_blocks %d "
+	TP_printk("dev %d,%d ino %llu mode 0%o i_blocks %llu used_blocks %d "
 		  "reserved_data_blocks %d quota_claim %d",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->mode, __entry->i_blocks,
 		  __entry->used_blocks, __entry->reserved_data_blocks,
 		  __entry->quota_claim)
@@ -1285,9 +1285,9 @@ TRACE_EVENT(ext4_da_reserve_space,
 	TP_ARGS(inode, nr_resv),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(	__u64,	i_blocks		)
+		__field(	dev_t,	dev			)
 		__field(	int,	reserve_blocks		)
 		__field(	int,	reserved_data_blocks	)
 		__field(	__u16,  mode			)
@@ -1302,10 +1302,10 @@ TRACE_EVENT(ext4_da_reserve_space,
 		__entry->mode	= inode->i_mode;
 	),
 
-	TP_printk("dev %d,%d ino %lu mode 0%o i_blocks %llu reserve_blocks %d"
+	TP_printk("dev %d,%d ino %llu mode 0%o i_blocks %llu reserve_blocks %d"
 		  "reserved_data_blocks %d",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->mode, __entry->i_blocks,
 		  __entry->reserve_blocks, __entry->reserved_data_blocks)
 );
@@ -1316,9 +1316,9 @@ TRACE_EVENT(ext4_da_release_space,
 	TP_ARGS(inode, freed_blocks),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(	__u64,	i_blocks		)
+		__field(	dev_t,	dev			)
 		__field(	int,	freed_blocks		)
 		__field(	int,	reserved_data_blocks	)
 		__field(	__u16,  mode			)
@@ -1333,10 +1333,10 @@ TRACE_EVENT(ext4_da_release_space,
 		__entry->mode	= inode->i_mode;
 	),
 
-	TP_printk("dev %d,%d ino %lu mode 0%o i_blocks %llu freed_blocks %d "
+	TP_printk("dev %d,%d ino %llu mode 0%o i_blocks %llu freed_blocks %d "
 		  "reserved_data_blocks %d",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->mode, __entry->i_blocks,
 		  __entry->freed_blocks, __entry->reserved_data_blocks)
 );
@@ -1412,10 +1412,10 @@ DECLARE_EVENT_CLASS(ext4__fallocate_mode,
 	TP_ARGS(inode, offset, len, mode),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(	loff_t,	offset			)
 		__field(	loff_t, len			)
+		__field(	dev_t,	dev			)
 		__field(	int,	mode			)
 	),
 
@@ -1427,9 +1427,9 @@ DECLARE_EVENT_CLASS(ext4__fallocate_mode,
 		__entry->mode	= mode;
 	),
 
-	TP_printk("dev %d,%d ino %lu offset %lld len %lld mode %s",
+	TP_printk("dev %d,%d ino %llu offset %lld len %lld mode %s",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->offset, __entry->len,
 		  show_falloc_mode(__entry->mode))
 );
@@ -1462,9 +1462,9 @@ TRACE_EVENT(ext4_fallocate_exit,
 	TP_ARGS(inode, offset, max_blocks, ret),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(	loff_t,	pos			)
+		__field(	dev_t,	dev			)
 		__field(	unsigned int,	blocks		)
 		__field(	int, 	ret			)
 	),
@@ -1477,9 +1477,9 @@ TRACE_EVENT(ext4_fallocate_exit,
 		__entry->ret	= ret;
 	),
 
-	TP_printk("dev %d,%d ino %lu pos %lld blocks %u ret %d",
+	TP_printk("dev %d,%d ino %llu pos %lld blocks %u ret %d",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->pos, __entry->blocks,
 		  __entry->ret)
 );
@@ -1490,10 +1490,10 @@ TRACE_EVENT(ext4_unlink_enter,
 	TP_ARGS(parent, dentry),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
-		__field(	ino_t,	parent			)
+		__field(	u64,	ino			)
+		__field(	u64,	parent			)
 		__field(	loff_t,	size			)
+		__field(	dev_t,	dev			)
 	),
 
 	TP_fast_assign(
@@ -1503,10 +1503,10 @@ TRACE_EVENT(ext4_unlink_enter,
 		__entry->size		= d_inode(dentry)->i_size;
 	),
 
-	TP_printk("dev %d,%d ino %lu size %lld parent %lu",
+	TP_printk("dev %d,%d ino %llu size %lld parent %llu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino, __entry->size,
-		  (unsigned long) __entry->parent)
+		  __entry->ino, __entry->size,
+		  __entry->parent)
 );
 
 TRACE_EVENT(ext4_unlink_exit,
@@ -1515,8 +1515,8 @@ TRACE_EVENT(ext4_unlink_exit,
 	TP_ARGS(dentry, ret),
 
 	TP_STRUCT__entry(
+		__field(	u64,	ino			)
 		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
 		__field(	int,	ret			)
 	),
 
@@ -1526,9 +1526,9 @@ TRACE_EVENT(ext4_unlink_exit,
 		__entry->ret		= ret;
 	),
 
-	TP_printk("dev %d,%d ino %lu ret %d",
+	TP_printk("dev %d,%d ino %llu ret %d",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->ret)
 );
 
@@ -1538,9 +1538,9 @@ DECLARE_EVENT_CLASS(ext4__truncate,
 	TP_ARGS(inode),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,		dev		)
-		__field(	ino_t,		ino		)
+		__field(	u64,		ino		)
 		__field(	__u64,		blocks		)
+		__field(	dev_t,		dev		)
 	),
 
 	TP_fast_assign(
@@ -1549,9 +1549,9 @@ DECLARE_EVENT_CLASS(ext4__truncate,
 		__entry->blocks	= inode->i_blocks;
 	),
 
-	TP_printk("dev %d,%d ino %lu blocks %llu",
+	TP_printk("dev %d,%d ino %llu blocks %llu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino, __entry->blocks)
+		  __entry->ino, __entry->blocks)
 );
 
 DEFINE_EVENT(ext4__truncate, ext4_truncate_enter,
@@ -1576,13 +1576,13 @@ TRACE_EVENT(ext4_ext_convert_to_initialized_enter,
 	TP_ARGS(inode, map, ux),
 
 	TP_STRUCT__entry(
+		__field(	u64,		ino	)
+		__field(	ext4_fsblk_t,	u_pblk	)
 		__field(	dev_t,		dev	)
-		__field(	ino_t,		ino	)
 		__field(	ext4_lblk_t,	m_lblk	)
 		__field(	unsigned,	m_len	)
 		__field(	ext4_lblk_t,	u_lblk	)
 		__field(	unsigned,	u_len	)
-		__field(	ext4_fsblk_t,	u_pblk	)
 	),
 
 	TP_fast_assign(
@@ -1595,10 +1595,10 @@ TRACE_EVENT(ext4_ext_convert_to_initialized_enter,
 		__entry->u_pblk		= ext4_ext_pblock(ux);
 	),
 
-	TP_printk("dev %d,%d ino %lu m_lblk %u m_len %u u_lblk %u u_len %u "
+	TP_printk("dev %d,%d ino %llu m_lblk %u m_len %u u_lblk %u u_len %u "
 		  "u_pblk %llu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->m_lblk, __entry->m_len,
 		  __entry->u_lblk, __entry->u_len, __entry->u_pblk)
 );
@@ -1614,16 +1614,16 @@ TRACE_EVENT(ext4_ext_convert_to_initialized_fastpath,
 	TP_ARGS(inode, map, ux, ix),
 
 	TP_STRUCT__entry(
+		__field(	u64,		ino	)
+		__field(	ext4_fsblk_t,	u_pblk	)
+		__field(	ext4_fsblk_t,	i_pblk	)
 		__field(	dev_t,		dev	)
-		__field(	ino_t,		ino	)
 		__field(	ext4_lblk_t,	m_lblk	)
 		__field(	unsigned,	m_len	)
 		__field(	ext4_lblk_t,	u_lblk	)
 		__field(	unsigned,	u_len	)
-		__field(	ext4_fsblk_t,	u_pblk	)
 		__field(	ext4_lblk_t,	i_lblk	)
 		__field(	unsigned,	i_len	)
-		__field(	ext4_fsblk_t,	i_pblk	)
 	),
 
 	TP_fast_assign(
@@ -1639,11 +1639,11 @@ TRACE_EVENT(ext4_ext_convert_to_initialized_fastpath,
 		__entry->i_pblk		= ext4_ext_pblock(ix);
 	),
 
-	TP_printk("dev %d,%d ino %lu m_lblk %u m_len %u "
+	TP_printk("dev %d,%d ino %llu m_lblk %u m_len %u "
 		  "u_lblk %u u_len %u u_pblk %llu "
 		  "i_lblk %u i_len %u i_pblk %llu ",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->m_lblk, __entry->m_len,
 		  __entry->u_lblk, __entry->u_len, __entry->u_pblk,
 		  __entry->i_lblk, __entry->i_len, __entry->i_pblk)
@@ -1656,8 +1656,8 @@ DECLARE_EVENT_CLASS(ext4__map_blocks_enter,
 	TP_ARGS(inode, lblk, len, flags),
 
 	TP_STRUCT__entry(
+		__field(	u64,		ino		)
 		__field(	dev_t,		dev		)
-		__field(	ino_t,		ino		)
 		__field(	ext4_lblk_t,	lblk		)
 		__field(	unsigned int,	len		)
 		__field(	unsigned int,	flags		)
@@ -1671,9 +1671,9 @@ DECLARE_EVENT_CLASS(ext4__map_blocks_enter,
 		__entry->flags	= flags;
 	),
 
-	TP_printk("dev %d,%d ino %lu lblk %u len %u flags %s",
+	TP_printk("dev %d,%d ino %llu lblk %u len %u flags %s",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->lblk, __entry->len, show_map_flags(__entry->flags))
 );
 
@@ -1698,10 +1698,10 @@ DECLARE_EVENT_CLASS(ext4__map_blocks_exit,
 	TP_ARGS(inode, flags, map, ret),
 
 	TP_STRUCT__entry(
+		__field(	u64,		ino		)
+		__field(	ext4_fsblk_t,	pblk		)
 		__field(	dev_t,		dev		)
-		__field(	ino_t,		ino		)
 		__field(	unsigned int,	flags		)
-		__field(	ext4_fsblk_t,	pblk		)
 		__field(	ext4_lblk_t,	lblk		)
 		__field(	unsigned int,	len		)
 		__field(	unsigned int,	mflags		)
@@ -1719,10 +1719,10 @@ DECLARE_EVENT_CLASS(ext4__map_blocks_exit,
 		__entry->ret	= ret;
 	),
 
-	TP_printk("dev %d,%d ino %lu flags %s lblk %u pblk %llu len %u "
+	TP_printk("dev %d,%d ino %llu flags %s lblk %u pblk %llu len %u "
 		  "mflags %s ret %d",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  show_map_flags(__entry->flags), __entry->lblk, __entry->pblk,
 		  __entry->len, show_mflags(__entry->mflags), __entry->ret)
 );
@@ -1747,9 +1747,9 @@ TRACE_EVENT(ext4_ext_load_extent,
 	TP_ARGS(inode, lblk, pblk),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,		dev		)
-		__field(	ino_t,		ino		)
+		__field(	u64,		ino		)
 		__field(	ext4_fsblk_t,	pblk		)
+		__field(	dev_t,		dev		)
 		__field(	ext4_lblk_t,	lblk		)
 	),
 
@@ -1760,9 +1760,9 @@ TRACE_EVENT(ext4_ext_load_extent,
 		__entry->lblk	= lblk;
 	),
 
-	TP_printk("dev %d,%d ino %lu lblk %u pblk %llu",
+	TP_printk("dev %d,%d ino %llu lblk %u pblk %llu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->lblk, __entry->pblk)
 );
 
@@ -1772,8 +1772,8 @@ TRACE_EVENT(ext4_load_inode,
 	TP_ARGS(sb, ino),
 
 	TP_STRUCT__entry(
+		__field(	u64,	ino		)
 		__field(	dev_t,	dev		)
-		__field(	ino_t,	ino		)
 	),
 
 	TP_fast_assign(
@@ -1781,9 +1781,9 @@ TRACE_EVENT(ext4_load_inode,
 		__entry->ino		= ino;
 	),
 
-	TP_printk("dev %d,%d ino %ld",
+	TP_printk("dev %d,%d ino %lld",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino)
+		  __entry->ino)
 );
 
 TRACE_EVENT(ext4_journal_start_sb,
@@ -1823,7 +1823,7 @@ TRACE_EVENT(ext4_journal_start_inode,
 	TP_ARGS(inode, blocks, rsv_blocks, revoke_creds, type, IP),
 
 	TP_STRUCT__entry(
-		__field(	unsigned long,	ino		)
+		__field(	u64,		ino		)
 		__field(	dev_t,		dev		)
 		__field(	unsigned long,	ip		)
 		__field(	int,		blocks		)
@@ -1843,10 +1843,10 @@ TRACE_EVENT(ext4_journal_start_inode,
 	),
 
 	TP_printk("dev %d,%d blocks %d, rsv_blocks %d, revoke_creds %d,"
-		  " type %d, ino %lu, caller %pS", MAJOR(__entry->dev),
+		  " type %d, ino %llu, caller %pS", MAJOR(__entry->dev),
 		  MINOR(__entry->dev), __entry->blocks, __entry->rsv_blocks,
-		  __entry->revoke_creds, __entry->type, __entry->ino,
-		  (void *)__entry->ip)
+		  __entry->revoke_creds, __entry->type,
+		  __entry->ino, (void *)__entry->ip)
 );
 
 TRACE_EVENT(ext4_journal_start_reserved,
@@ -1927,14 +1927,14 @@ TRACE_EVENT(ext4_ext_handle_unwritten_extents,
 	TP_ARGS(inode, map, flags, allocated, newblock),
 
 	TP_STRUCT__entry(
+		__field(	u64,		ino		)
+		__field(	ext4_fsblk_t,	pblk		)
+		__field(	ext4_fsblk_t,	newblk		)
 		__field(	dev_t,		dev		)
-		__field(	ino_t,		ino		)
 		__field(	int,		flags		)
 		__field(	ext4_lblk_t,	lblk		)
-		__field(	ext4_fsblk_t,	pblk		)
 		__field(	unsigned int,	len		)
 		__field(	unsigned int,	allocated	)
-		__field(	ext4_fsblk_t,	newblk		)
 	),
 
 	TP_fast_assign(
@@ -1948,10 +1948,10 @@ TRACE_EVENT(ext4_ext_handle_unwritten_extents,
 		__entry->newblk		= newblock;
 	),
 
-	TP_printk("dev %d,%d ino %lu m_lblk %u m_pblk %llu m_len %u flags %s "
+	TP_printk("dev %d,%d ino %llu m_lblk %u m_pblk %llu m_len %u flags %s "
 		  "allocated %d newblock %llu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  (unsigned) __entry->lblk, (unsigned long long) __entry->pblk,
 		  __entry->len, show_map_flags(__entry->flags),
 		  (unsigned int) __entry->allocated,
@@ -1994,9 +1994,9 @@ TRACE_EVENT(ext4_ext_show_extent,
 	TP_ARGS(inode, lblk, pblk, len),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,		dev	)
-		__field(	ino_t,		ino	)
+		__field(	u64,		ino	)
 		__field(	ext4_fsblk_t,	pblk	)
+		__field(	dev_t,		dev	)
 		__field(	ext4_lblk_t,	lblk	)
 		__field(	unsigned short,	len	)
 	),
@@ -2009,9 +2009,9 @@ TRACE_EVENT(ext4_ext_show_extent,
 		__entry->len	= len;
 	),
 
-	TP_printk("dev %d,%d ino %lu lblk %u pblk %llu len %u",
+	TP_printk("dev %d,%d ino %llu lblk %u pblk %llu len %u",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  (unsigned) __entry->lblk,
 		  (unsigned long long) __entry->pblk,
 		  (unsigned short) __entry->len)
@@ -2025,14 +2025,14 @@ TRACE_EVENT(ext4_remove_blocks,
 	TP_ARGS(inode, ex, from, to, pc),
 
 	TP_STRUCT__entry(
+		__field(	u64,		ino	)
+		__field(	ext4_fsblk_t,	ee_pblk	)
+		__field(	ext4_fsblk_t,	pc_pclu	)
 		__field(	dev_t,		dev	)
-		__field(	ino_t,		ino	)
 		__field(	ext4_lblk_t,	from	)
 		__field(	ext4_lblk_t,	to	)
-		__field(	ext4_fsblk_t,	ee_pblk	)
 		__field(	ext4_lblk_t,	ee_lblk	)
 		__field(	unsigned short,	ee_len	)
-		__field(	ext4_fsblk_t,	pc_pclu	)
 		__field(	ext4_lblk_t,	pc_lblk	)
 		__field(	int,		pc_state)
 	),
@@ -2050,10 +2050,10 @@ TRACE_EVENT(ext4_remove_blocks,
 		__entry->pc_state	= pc->state;
 	),
 
-	TP_printk("dev %d,%d ino %lu extent [%u(%llu), %u]"
+	TP_printk("dev %d,%d ino %llu extent [%u(%llu), %u]"
 		  "from %u to %u partial [pclu %lld lblk %u state %d]",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  (unsigned) __entry->ee_lblk,
 		  (unsigned long long) __entry->ee_pblk,
 		  (unsigned short) __entry->ee_len,
@@ -2072,13 +2072,13 @@ TRACE_EVENT(ext4_ext_rm_leaf,
 	TP_ARGS(inode, start, ex, pc),
 
 	TP_STRUCT__entry(
+		__field(	u64,		ino	)
+		__field(	ext4_fsblk_t,	ee_pblk	)
+		__field(	ext4_fsblk_t,	pc_pclu	)
 		__field(	dev_t,		dev	)
-		__field(	ino_t,		ino	)
 		__field(	ext4_lblk_t,	start	)
 		__field(	ext4_lblk_t,	ee_lblk	)
-		__field(	ext4_fsblk_t,	ee_pblk	)
 		__field(	short,		ee_len	)
-		__field(	ext4_fsblk_t,	pc_pclu	)
 		__field(	ext4_lblk_t,	pc_lblk	)
 		__field(	int,		pc_state)
 	),
@@ -2095,10 +2095,10 @@ TRACE_EVENT(ext4_ext_rm_leaf,
 		__entry->pc_state	= pc->state;
 	),
 
-	TP_printk("dev %d,%d ino %lu start_lblk %u last_extent [%u(%llu), %u]"
+	TP_printk("dev %d,%d ino %llu start_lblk %u last_extent [%u(%llu), %u]"
 		  "partial [pclu %lld lblk %u state %d]",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  (unsigned) __entry->start,
 		  (unsigned) __entry->ee_lblk,
 		  (unsigned long long) __entry->ee_pblk,
@@ -2114,9 +2114,9 @@ TRACE_EVENT(ext4_ext_rm_idx,
 	TP_ARGS(inode, pblk),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,		dev	)
-		__field(	ino_t,		ino	)
+		__field(	u64,		ino	)
 		__field(	ext4_fsblk_t,	pblk	)
+		__field(	dev_t,		dev	)
 	),
 
 	TP_fast_assign(
@@ -2125,9 +2125,9 @@ TRACE_EVENT(ext4_ext_rm_idx,
 		__entry->pblk	= pblk;
 	),
 
-	TP_printk("dev %d,%d ino %lu index_pblk %llu",
+	TP_printk("dev %d,%d ino %llu index_pblk %llu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  (unsigned long long) __entry->pblk)
 );
 
@@ -2138,8 +2138,8 @@ TRACE_EVENT(ext4_ext_remove_space,
 	TP_ARGS(inode, start, end, depth),
 
 	TP_STRUCT__entry(
+		__field(	u64,		ino	)
 		__field(	dev_t,		dev	)
-		__field(	ino_t,		ino	)
 		__field(	ext4_lblk_t,	start	)
 		__field(	ext4_lblk_t,	end	)
 		__field(	int,		depth	)
@@ -2153,9 +2153,9 @@ TRACE_EVENT(ext4_ext_remove_space,
 		__entry->depth	= depth;
 	),
 
-	TP_printk("dev %d,%d ino %lu since %u end %u depth %d",
+	TP_printk("dev %d,%d ino %llu since %u end %u depth %d",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  (unsigned) __entry->start,
 		  (unsigned) __entry->end,
 		  __entry->depth)
@@ -2168,12 +2168,12 @@ TRACE_EVENT(ext4_ext_remove_space_done,
 	TP_ARGS(inode, start, end, depth, pc, eh_entries),
 
 	TP_STRUCT__entry(
+		__field(	u64,		ino		)
+		__field(	ext4_fsblk_t,	pc_pclu		)
 		__field(	dev_t,		dev		)
-		__field(	ino_t,		ino		)
 		__field(	ext4_lblk_t,	start		)
 		__field(	ext4_lblk_t,	end		)
 		__field(	int,		depth		)
-		__field(	ext4_fsblk_t,	pc_pclu		)
 		__field(	ext4_lblk_t,	pc_lblk		)
 		__field(	int,		pc_state	)
 		__field(	unsigned short,	eh_entries	)
@@ -2191,11 +2191,11 @@ TRACE_EVENT(ext4_ext_remove_space_done,
 		__entry->eh_entries	= le16_to_cpu(eh_entries);
 	),
 
-	TP_printk("dev %d,%d ino %lu since %u end %u depth %d "
+	TP_printk("dev %d,%d ino %llu since %u end %u depth %d "
 		  "partial [pclu %lld lblk %u state %d] "
 		  "remaining_entries %u",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  (unsigned) __entry->start,
 		  (unsigned) __entry->end,
 		  __entry->depth,
@@ -2211,13 +2211,13 @@ DECLARE_EVENT_CLASS(ext4__es_extent,
 	TP_ARGS(inode, es),
 
 	TP_STRUCT__entry(
+		__field(	u64,		ino		)
+		__field(	u64,		seq		)
+		__field(	ext4_fsblk_t,	pblk		)
 		__field(	dev_t,		dev		)
-		__field(	ino_t,		ino		)
 		__field(	ext4_lblk_t,	lblk		)
 		__field(	ext4_lblk_t,	len		)
-		__field(	ext4_fsblk_t,	pblk		)
 		__field(	char,		status		)
-		__field(	u64,		seq		)
 	),
 
 	TP_fast_assign(
@@ -2230,9 +2230,9 @@ DECLARE_EVENT_CLASS(ext4__es_extent,
 		__entry->seq	= EXT4_I(inode)->i_es_seq;
 	),
 
-	TP_printk("dev %d,%d ino %lu es [%u/%u) mapped %llu status %s seq %llu",
+	TP_printk("dev %d,%d ino %llu es [%u/%u) mapped %llu status %s seq %llu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->lblk, __entry->len,
 		  __entry->pblk, show_extent_status(__entry->status),
 		  __entry->seq)
@@ -2256,11 +2256,11 @@ TRACE_EVENT(ext4_es_remove_extent,
 	TP_ARGS(inode, lblk, len),
 
 	TP_STRUCT__entry(
-		__field(	dev_t,	dev			)
-		__field(	ino_t,	ino			)
+		__field(	u64,	ino			)
 		__field(	loff_t,	lblk			)
 		__field(	loff_t,	len			)
 		__field(	u64,	seq			)
+		__field(	dev_t,	dev			)
 	),
 
 	TP_fast_assign(
@@ -2271,9 +2271,9 @@ TRACE_EVENT(ext4_es_remove_extent,
 		__entry->seq	= EXT4_I(inode)->i_es_seq;
 	),
 
-	TP_printk("dev %d,%d ino %lu es [%lld/%lld) seq %llu",
+	TP_printk("dev %d,%d ino %llu es [%lld/%lld) seq %llu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->lblk, __entry->len, __entry->seq)
 );
 
@@ -2283,8 +2283,8 @@ TRACE_EVENT(ext4_es_find_extent_range_enter,
 	TP_ARGS(inode, lblk),
 
 	TP_STRUCT__entry(
+		__field(	u64,		ino		)
 		__field(	dev_t,		dev		)
-		__field(	ino_t,		ino		)
 		__field(	ext4_lblk_t,	lblk		)
 	),
 
@@ -2294,9 +2294,9 @@ TRACE_EVENT(ext4_es_find_extent_range_enter,
 		__entry->lblk	= lblk;
 	),
 
-	TP_printk("dev %d,%d ino %lu lblk %u",
+	TP_printk("dev %d,%d ino %llu lblk %u",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino, __entry->lblk)
+		  __entry->ino, __entry->lblk)
 );
 
 TRACE_EVENT(ext4_es_find_extent_range_exit,
@@ -2305,11 +2305,11 @@ TRACE_EVENT(ext4_es_find_extent_range_exit,
 	TP_ARGS(inode, es),
 
 	TP_STRUCT__entry(
+		__field(	u64,		ino		)
+		__field(	ext4_fsblk_t,	pblk		)
 		__field(	dev_t,		dev		)
-		__field(	ino_t,		ino		)
 		__field(	ext4_lblk_t,	lblk		)
 		__field(	ext4_lblk_t,	len		)
-		__field(	ext4_fsblk_t,	pblk		)
 		__field(	char, status	)
 	),
 
@@ -2322,9 +2322,9 @@ TRACE_EVENT(ext4_es_find_extent_range_exit,
 		__entry->status	= ext4_es_status(es);
 	),
 
-	TP_printk("dev %d,%d ino %lu es [%u/%u) mapped %llu status %s",
+	TP_printk("dev %d,%d ino %llu es [%u/%u) mapped %llu status %s",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->lblk, __entry->len,
 		  __entry->pblk, show_extent_status(__entry->status))
 );
@@ -2335,8 +2335,8 @@ TRACE_EVENT(ext4_es_lookup_extent_enter,
 	TP_ARGS(inode, lblk),
 
 	TP_STRUCT__entry(
+		__field(	u64,		ino		)
 		__field(	dev_t,		dev		)
-		__field(	ino_t,		ino		)
 		__field(	ext4_lblk_t,	lblk		)
 	),
 
@@ -2346,9 +2346,9 @@ TRACE_EVENT(ext4_es_lookup_extent_enter,
 		__entry->lblk	= lblk;
 	),
 
-	TP_printk("dev %d,%d ino %lu lblk %u",
+	TP_printk("dev %d,%d ino %llu lblk %u",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino, __entry->lblk)
+		  __entry->ino, __entry->lblk)
 );
 
 TRACE_EVENT(ext4_es_lookup_extent_exit,
@@ -2358,13 +2358,13 @@ TRACE_EVENT(ext4_es_lookup_extent_exit,
 	TP_ARGS(inode, es, found),
 
 	TP_STRUCT__entry(
+		__field(	u64,		ino		)
+		__field(	ext4_fsblk_t,	pblk		)
 		__field(	dev_t,		dev		)
-		__field(	ino_t,		ino		)
 		__field(	ext4_lblk_t,	lblk		)
 		__field(	ext4_lblk_t,	len		)
-		__field(	ext4_fsblk_t,	pblk		)
-		__field(	char,		status		)
 		__field(	int,		found		)
+		__field(	char,		status		)
 	),
 
 	TP_fast_assign(
@@ -2377,9 +2377,9 @@ TRACE_EVENT(ext4_es_lookup_extent_exit,
 		__entry->found	= found;
 	),
 
-	TP_printk("dev %d,%d ino %lu found %d [%u/%u) %llu %s",
+	TP_printk("dev %d,%d ino %llu found %d [%u/%u) %llu %s",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino, __entry->found,
+		  __entry->ino, __entry->found,
 		  __entry->lblk, __entry->len,
 		  __entry->found ? __entry->pblk : 0,
 		  show_extent_status(__entry->found ? __entry->status : 0))
@@ -2447,10 +2447,10 @@ TRACE_EVENT(ext4_collapse_range,
 	TP_ARGS(inode, offset, len),
 
 	TP_STRUCT__entry(
-		__field(dev_t,	dev)
-		__field(ino_t,	ino)
+		__field(u64,	ino)
 		__field(loff_t,	offset)
 		__field(loff_t, len)
+		__field(dev_t,	dev)
 	),
 
 	TP_fast_assign(
@@ -2460,9 +2460,9 @@ TRACE_EVENT(ext4_collapse_range,
 		__entry->len	= len;
 	),
 
-	TP_printk("dev %d,%d ino %lu offset %lld len %lld",
+	TP_printk("dev %d,%d ino %llu offset %lld len %lld",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->offset, __entry->len)
 );
 
@@ -2472,10 +2472,10 @@ TRACE_EVENT(ext4_insert_range,
 	TP_ARGS(inode, offset, len),
 
 	TP_STRUCT__entry(
-		__field(dev_t,	dev)
-		__field(ino_t,	ino)
+		__field(u64,	ino)
 		__field(loff_t,	offset)
 		__field(loff_t, len)
+		__field(dev_t,	dev)
 	),
 
 	TP_fast_assign(
@@ -2485,9 +2485,9 @@ TRACE_EVENT(ext4_insert_range,
 		__entry->len	= len;
 	),
 
-	TP_printk("dev %d,%d ino %lu offset %lld len %lld",
+	TP_printk("dev %d,%d ino %llu offset %lld len %lld",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->offset, __entry->len)
 );
 
@@ -2526,15 +2526,15 @@ TRACE_EVENT(ext4_es_insert_delayed_extent,
 	TP_ARGS(inode, es, lclu_allocated, end_allocated),
 
 	TP_STRUCT__entry(
+		__field(	u64,		ino		)
+		__field(	u64,		seq		)
+		__field(	ext4_fsblk_t,	pblk		)
 		__field(	dev_t,		dev		)
-		__field(	ino_t,		ino		)
 		__field(	ext4_lblk_t,	lblk		)
 		__field(	ext4_lblk_t,	len		)
-		__field(	ext4_fsblk_t,	pblk		)
 		__field(	char,		status		)
 		__field(	bool,		lclu_allocated	)
 		__field(	bool,		end_allocated	)
-		__field(	u64,		seq		)
 	),
 
 	TP_fast_assign(
@@ -2549,9 +2549,9 @@ TRACE_EVENT(ext4_es_insert_delayed_extent,
 		__entry->seq		= EXT4_I(inode)->i_es_seq;
 	),
 
-	TP_printk("dev %d,%d ino %lu es [%u/%u) mapped %llu status %s allocated %d %d seq %llu",
+	TP_printk("dev %d,%d ino %llu es [%u/%u) mapped %llu status %s allocated %d %d seq %llu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->ino,
+		  __entry->ino,
 		  __entry->lblk, __entry->len,
 		  __entry->pblk, show_extent_status(__entry->status),
 		  __entry->lclu_allocated, __entry->end_allocated,
@@ -2875,9 +2875,9 @@ DECLARE_EVENT_CLASS(ext4_fc_track_dentry,
 	TP_ARGS(handle, inode, dentry, ret),
 
 	TP_STRUCT__entry(
+		__field(u64, i_ino)
 		__field(dev_t, dev)
 		__field(tid_t, t_tid)
-		__field(ino_t, i_ino)
 		__field(tid_t, i_sync_tid)
 		__field(int, error)
 	),
@@ -2892,7 +2892,7 @@ DECLARE_EVENT_CLASS(ext4_fc_track_dentry,
 		__entry->error = ret;
 	),
 
-	TP_printk("dev %d,%d, t_tid %u, ino %lu, i_sync_tid %u, error %d",
+	TP_printk("dev %d,%d, t_tid %u, ino %llu, i_sync_tid %u, error %d",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
 		  __entry->t_tid, __entry->i_ino, __entry->i_sync_tid,
 		  __entry->error
@@ -2916,9 +2916,9 @@ TRACE_EVENT(ext4_fc_track_inode,
 	TP_ARGS(handle, inode, ret),
 
 	TP_STRUCT__entry(
+		__field(u64, i_ino)
 		__field(dev_t, dev)
 		__field(tid_t, t_tid)
-		__field(ino_t, i_ino)
 		__field(tid_t, i_sync_tid)
 		__field(int, error)
 	),
@@ -2933,7 +2933,7 @@ TRACE_EVENT(ext4_fc_track_inode,
 		__entry->error = ret;
 	),
 
-	TP_printk("dev %d:%d, t_tid %u, inode %lu, i_sync_tid %u, error %d",
+	TP_printk("dev %d:%d, t_tid %u, inode %llu, i_sync_tid %u, error %d",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
 		  __entry->t_tid, __entry->i_ino, __entry->i_sync_tid,
 		  __entry->error)
@@ -2946,12 +2946,12 @@ TRACE_EVENT(ext4_fc_track_range,
 	TP_ARGS(handle, inode, start, end, ret),
 
 	TP_STRUCT__entry(
+		__field(u64, i_ino)
+		__field(long, start)
+		__field(long, end)
 		__field(dev_t, dev)
 		__field(tid_t, t_tid)
-		__field(ino_t, i_ino)
 		__field(tid_t, i_sync_tid)
-		__field(long, start)
-		__field(long, end)
 		__field(int, error)
 	),
 
@@ -2967,7 +2967,7 @@ TRACE_EVENT(ext4_fc_track_range,
 		__entry->error = ret;
 	),
 
-	TP_printk("dev %d:%d, t_tid %u, inode %lu, i_sync_tid %u, error %d, start %ld, end %ld",
+	TP_printk("dev %d:%d, t_tid %u, inode %llu, i_sync_tid %u, error %d, start %ld, end %ld",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
 		  __entry->t_tid, __entry->i_ino, __entry->i_sync_tid,
 		  __entry->error, __entry->start, __entry->end)
@@ -3029,11 +3029,11 @@ TRACE_EVENT(ext4_move_extent_enter,
 	TP_ARGS(orig_inode, orig_map, donor_inode, donor_lblk),
 
 	TP_STRUCT__entry(
+		__field(u64, orig_ino)
+		__field(u64, donor_ino)
 		__field(dev_t, dev)
-		__field(ino_t, orig_ino)
 		__field(ext4_lblk_t, orig_lblk)
 		__field(unsigned int, orig_flags)
-		__field(ino_t, donor_ino)
 		__field(ext4_lblk_t, donor_lblk)
 		__field(unsigned int, len)
 	),
@@ -3048,11 +3048,11 @@ TRACE_EVENT(ext4_move_extent_enter,
 		__entry->len		= orig_map->m_len;
 	),
 
-	TP_printk("dev %d,%d origin ino %lu lblk %u flags %s donor ino %lu lblk %u len %u",
+	TP_printk("dev %d,%d origin ino %llu lblk %u flags %s donor ino %llu lblk %u len %u",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->orig_ino,  __entry->orig_lblk,
+		  __entry->orig_ino,  __entry->orig_lblk,
 		  show_mflags(__entry->orig_flags),
-		  (unsigned long) __entry->donor_ino,  __entry->donor_lblk,
+		  __entry->donor_ino,  __entry->donor_lblk,
 		  __entry->len)
 );
 
@@ -3065,13 +3065,13 @@ TRACE_EVENT(ext4_move_extent_exit,
 		move_len, move_type, ret),
 
 	TP_STRUCT__entry(
+		__field(u64, orig_ino)
+		__field(u64, donor_ino)
+		__field(u64, move_len)
 		__field(dev_t, dev)
-		__field(ino_t, orig_ino)
 		__field(ext4_lblk_t, orig_lblk)
-		__field(ino_t, donor_ino)
 		__field(ext4_lblk_t, donor_lblk)
 		__field(unsigned int, m_len)
-		__field(u64, move_len)
 		__field(int, move_type)
 		__field(int, ret)
 	),
@@ -3088,10 +3088,10 @@ TRACE_EVENT(ext4_move_extent_exit,
 		__entry->ret		= ret;
 	),
 
-	TP_printk("dev %d,%d origin ino %lu lblk %u donor ino %lu lblk %u m_len %u, move_len %llu type %d ret %d",
+	TP_printk("dev %d,%d origin ino %llu lblk %u donor ino %llu lblk %u m_len %u, move_len %llu type %d ret %d",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
-		  (unsigned long) __entry->orig_ino,  __entry->orig_lblk,
-		  (unsigned long) __entry->donor_ino,  __entry->donor_lblk,
+		  __entry->orig_ino,  __entry->orig_lblk,
+		  __entry->donor_ino,  __entry->donor_lblk,
 		  __entry->m_len, __entry->move_len, __entry->move_type,
 		  __entry->ret)
 );

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
