Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJHCBOf3pWkEIgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:49:43 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 447B31E0C57
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:49:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJXyxMVVbVI83ZGrVG+zhk5H/j5o9KG2W2bfrVnt1+k=; b=MDPPx30j1iXDKnS6vFne7H/2ZK
	e3XZCRtqkycDeat8Aqacpfyb3ZQ6DmuGVo+vq5WSkaNKtiGOxwIdiBjEICnt+E5pSv+HMOFcK/E0j
	KFB3xqwP85JGgfsc/O/KvXvBeMjb0EX2CC+YcVFgIspL7cssZjOeHIbL1mdfWP965S6U=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxACw-0003sI-6S;
	Mon, 02 Mar 2026 20:49:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vxACu-0003rb-SW;
 Mon, 02 Mar 2026 20:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DghIzVqbqugfjWxzK12XQfGtqk9IhJ8wjFTgevCYcHQ=; b=KsA03WTFqN7iffd2WLAtJTaiLW
 7Gr4k0Z/1pZWs/5acCCgwtzTB4HYnegP269WgTAjEKfGcMGQUba4zGPFZYAgd2FR1XaZiCqKg3fee
 +nSl98V9s+j7KeUsR7ZeuK+l3OzJCvHbM+CjPnmIVlCIM5F3MJOOf1IhXZPIm4FUFwls=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DghIzVqbqugfjWxzK12XQfGtqk9IhJ8wjFTgevCYcHQ=; b=fzn8dhf34SXE2864J6qexdE+Aj
 FTjCNzBLGQMGoB40EsqsQBAwudCmVpwlgWfveXpb+k+FWnbz3CJMZNXv97qnViVMzeqFql0FTsqpm
 dNJCuM6Wq6Rixwbc0H3/nlVmIJNGc0uBkO9Z8jkurax+cww5ZC5Y+zfue0WMUZqVlIMI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxACj-00076p-0D; Mon, 02 Mar 2026 20:49:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 28B1261338;
 Mon,  2 Mar 2026 20:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B31C2BC9E;
 Mon,  2 Mar 2026 20:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772484553;
 bh=6cZwsfpbObzNeQK7uzLXLbgL+hWNwgK2OM7xy5ID8J4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=IorKuZlvL6dslhQZhuCOB77oSou3b9HVCdnk+hCgyzh8s5PaZDXHXQRR8e/ueaj3v
 Of2NatafLlcq93I3N3tj+b+ji3Cw90UnmElVxNb7flMZt0afB/JdPeJYxL+ZfTA5Ed
 r0Z9ma/eWygxi1n/JRHTwMwmayCZetTxj3iG3May/82azlyawA58n4CaW9UKfbezRV
 txPWvxHfqldCnxmeykB5RfT0sF6KyZj6k8QVjuAXYISpgl9wdenOoGH8O6mP0feaF3
 y7dED4qd+cENaLutYTklGDqxvIvPzTVhN8sNmXnBBosIiQA1FoeB9I757q97DjpyFL
 yYxh3gef8x7+Q==
Date: Mon, 02 Mar 2026 15:25:25 -0500
MIME-Version: 1.0
Message-Id: <20260302-iino-u64-v2-101-e5388800dae0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3214; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=6cZwsfpbObzNeQK7uzLXLbgL+hWNwgK2OM7xy5ID8J4=;
 b=kA0DAAoBAA5oQRlWghUByyZiAGml8gujQ93Hzj5fXRpB1CYY3q3nHyAjWcLgnlNTz75TUF9PE
 YkCMwQAAQoAHRYhBEvA17JEcbKhhOr10wAOaEEZVoIVBQJppfILAAoJEAAOaEEZVoIVG/gP/1mz
 Z/aWsv6cLzW611kkwDhqAudZlM+C3BBx64Q0uc7G30XNc2yp0PWvuAMk61d9m6VCuoomh90jTr0
 NK6FFf3SL8jrC60bf3SoyBPUViDMMoKszBoRfVX2ASjXOLZJZzjeC5m0/glF5Wizs5+1UolOGYw
 wWYdsC+EeM6Qi6hHsqIONu2XYW2hepv6cwmVCFOPJAVcawQftNR+bvtC6wDTytEvgHKXjUTqhAS
 dpKjQ7vXFs+wZRVKSlavUg+b4iTYJhnZwifA44iJCd7edSq0hT6yK0/u91lhJaLGeadKtdIHHPj
 fHWpOhEWlg9lA4rhKrDRBHd1PZyjmhCxhcEfGIDdLnH7iesATUg9e2/6Eh9yJLEv1F8L+2RhdUQ
 ustpIjeJuUKJxHNOLj5kPcqOYapqJb+IsiP5qBGKMgNxAHDebqn357vmChru0JtK0EAe/xn0jai
 BCD5MX12d8DF4il2j5RTcpQX5sqs38yjrTATcTpDS98mNtHwOt9kMg0Whs5spp3DoqdpOb6kEqY
 Ee50OlpWXEY0cz+TyNIGDLRTvcizbTME7y0X9K9VolAB1L3Zttt8gL73zMs0WJi+TlQk35WSX8w
 0g4Q7ostGDkCw5+XEqNWcIAanuZS6o5ssN4Bnpn/NIw6AWt87L3RuH4HvJoG7EDPCPQdKfUSflG
 5+vLL
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Now that i_ino is u64 and the PRIino format macro has been
 removed,
 replace all uses in fscrypt with the concrete format strings. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/crypto/crypto.c | 2 +-
 fs/crypto/hooks.c
 | 2 +- fs/crypto/keyring.c | 4 ++-- fs/crypto/keysetup.c | 2 +- 4 files
 changed, 5 insertions(+), 5 dele [...] 
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
X-Headers-End: 1vxACj-00076p-0D
Subject: [f2fs-dev] [PATCH v2 101/110] fscrypt: replace PRIino with
 %llu/%llx format strings
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
X-Rspamd-Queue-Id: 447B31E0C57
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,goodmis.org,efficios.com,intel.com,infradead.org,mit.edu,linux.dev,suse.de,redhat.com,manguebit.org,dilger.ca,suse.com,oracle.com,brown.name,talpey.com,samba.org,gmail.com,microsoft.com,dubeyko.com,ionkov.net,codewreck.org,crudebyte.com,auristor.com,themaw.net,cs.cmu.edu,fluxnic.net,tyhicks.com,physik.fu-berlin.de,vivo.com,artax.karlin.mff.cuni.cz,nod.at,paragon-software.com,fasheh.com,evilplan.org,linux.alibaba.com,omnibond.com,szeredi.hu,alarsen.net,huawei.com,wdc.com,canonical.com,paul-moore.com,namei.org,hallyn.com,linux.ibm.com,schaufler-ca.com,amd.com,ffwll.ch,linaro.org,google.com,davemloft.net,arm.com,linux.intel.com,dev.tdt.de,yaina.de,holtmann.org,hartkopp.net,pengutronix.de,secunet.com,gondor.apana.org.au,fomichev.me,iogearbox.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[172];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jlayton@kernel.org]
X-Rspamd-Action: no action

Now that i_ino is u64 and the PRIino format macro has been removed,
replace all uses in fscrypt with the concrete format strings.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/crypto/crypto.c   | 2 +-
 fs/crypto/hooks.c    | 2 +-
 fs/crypto/keyring.c  | 4 ++--
 fs/crypto/keysetup.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 4fc2990642fd3ee385a9919183cbb0f1c5ba6a58..570a2231c945a6c649cf8dc3b457f0b55657e0c3 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -365,7 +365,7 @@ void fscrypt_msg(const struct inode *inode, const char *level,
 	vaf.fmt = fmt;
 	vaf.va = &args;
 	if (inode && inode->i_ino)
-		printk("%sfscrypt (%s, inode %" PRIino "u): %pV\n",
+		printk("%sfscrypt (%s, inode %llu): %pV\n",
 		       level, inode->i_sb->s_id, inode->i_ino, &vaf);
 	else if (inode)
 		printk("%sfscrypt (%s): %pV\n", level, inode->i_sb->s_id, &vaf);
diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index f41809f1f1ed0b1ed78b85a4a987ec9e6cbcfa9d..a7a8a3f581a0460537f5ff955bc8b5d30573a033 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -62,7 +62,7 @@ int fscrypt_file_open(struct inode *inode, struct file *filp)
 	dentry_parent = dget_parent(dentry);
 	if (!fscrypt_has_permitted_context(d_inode(dentry_parent), inode)) {
 		fscrypt_warn(inode,
-			     "Inconsistent encryption context (parent directory: %" PRIino "u)",
+			     "Inconsistent encryption context (parent directory: %llu)",
 			     d_inode(dentry_parent)->i_ino);
 		err = -EPERM;
 	}
diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index c0a2568a88cf6318877dec0f5379c5c8511c00f8..be8e6e8011f2131f2908da746a37d33fd5295122 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -970,7 +970,7 @@ static int check_for_busy_inodes(struct super_block *sb,
 	struct list_head *pos;
 	size_t busy_count = 0;
 	char ino_str[50] = "";
-	kino_t ino;
+	u64 ino;
 
 	spin_lock(&mk->mk_decrypted_inodes_lock);
 
@@ -994,7 +994,7 @@ static int check_for_busy_inodes(struct super_block *sb,
 
 	/* If the inode is currently being created, ino may still be 0. */
 	if (ino)
-		snprintf(ino_str, sizeof(ino_str), ", including ino %" PRIino "u", ino);
+		snprintf(ino_str, sizeof(ino_str), ", including ino %llu", ino);
 
 	fscrypt_warn(NULL,
 		     "%s: %zu inode(s) still busy after removing key with %s %*phN%s",
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index b30630f2c6a4e341c72af0db6aa173f59f742fa1..df58ca4a5e3cb1df94e2f08e3f3b093c33368993 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -91,7 +91,7 @@ select_encryption_mode(const union fscrypt_policy *policy,
 	if (S_ISDIR(inode->i_mode) || S_ISLNK(inode->i_mode))
 		return &fscrypt_modes[fscrypt_policy_fnames_mode(policy)];
 
-	WARN_ONCE(1, "fscrypt: filesystem tried to load encryption info for inode %" PRIino "u, which is not encryptable (file type %d)\n",
+	WARN_ONCE(1, "fscrypt: filesystem tried to load encryption info for inode %llu, which is not encryptable (file type %d)\n",
 		  inode->i_ino, (inode->i_mode & S_IFMT));
 	return ERR_PTR(-EINVAL);
 }

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
