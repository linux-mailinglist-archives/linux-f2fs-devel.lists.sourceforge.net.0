Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJ1NNTCbqmmbUQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 06 Mar 2026 10:15:28 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2009C21DB9F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 06 Mar 2026 10:15:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bH/kXuFbcldMeucygBuJ+4ckqixhgNP2QpFVU76lozM=; b=Pv8+BA1H9g5RHL8H/Cgov7RYoC
	zsv5dO2d94rHx9xwbql5ohKNkYnX9SG2Na/qP+gHz206Qi6P18BRyB4yzy9VpU4HsU6+EVIitKIGS
	e0t7WwcIQkkWApoSdoNCDqhH6jRAvE63jLux/Re6JKU88e2igJ3Ndu0mG5Slwn3b3lP4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vyRHA-0001iq-5k;
	Fri, 06 Mar 2026 09:15:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1vyRH8-0001iO-2k;
 Fri, 06 Mar 2026 09:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Khay5Di4gN/G+A9UrPoC+jc9Xk/9Lb4+jkpc4uytkJA=; b=Oir6OwQaVgu2JG5a5SZswsGbmH
 boDUUB2stnmG7W2wp9sI0V+rQDyUgImQNiVPaR4G46ga2UXDr6nfu61KKcp4aD0+Kb6Qsv6Zf3+2l
 J/yNRQiUjSi57PxZir5X8Nf6nomYW3/NQ+iQ+8AoqO1YCe6LlqX+QrS+RLqoFXULRRmU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Khay5Di4gN/G+A9UrPoC+jc9Xk/9Lb4+jkpc4uytkJA=; b=WvMqKJ+O68shThi+sTCRGZFwCr
 ssC4nS71aYQwJBgxS09opFn2nvx2NA/IywFKI+8eEvJryreuhrmg0tlcPMqf91/7YPGsIF+8FuNP+
 T2ci2+tn2IID3xrl1yIxAZYMBgGRF7mKnKTyAT2q6c9xevohVgbj9JITX1stYNXSffpY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vyRH8-0003tq-7o; Fri, 06 Mar 2026 09:15:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DAE616012A;
 Fri,  6 Mar 2026 09:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C425BC4CEF7;
 Fri,  6 Mar 2026 09:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772788507;
 bh=7RvOdnrFs/iEe9G84pPe+q4PLv+gFd3Sa58Nl0eTC8M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TyR366hpH5SBgvb3stJOO+3+JgB4eyp8Ub6SIcEY5Wv5+DIXq3qwQ1akUuyGzm4GI
 oVWqv0SYGKFQk/aIJcLbDc3SkZdh03GwnjPJPfc8DHBxnnTk3pTwokbH2aquirHejB
 nz1gJxpKMhkWSd0cvlbIm12Yo0dUUSzlaMGnA70lo5LCfYmGHYkoB3BEoaWxEw9skO
 0XSBCv8+kTn/Gf5HrA+24udlPqxoLhC1731SEC00PUdG+t6hKArOjAPEtT/hHxR1LY
 s+VuE2scXcViJMBvNGcnMzw7bfK0RAeQxP1RLAMHfxMD+S62KQ5DOUo/0QF6h57vkJ
 rf8R3FiiVNktg==
To: Jeff Layton <jlayton@kernel.org>
Date: Fri,  6 Mar 2026 10:09:33 +0100
Message-ID: <20260306-kennen-zubrot-2605fcfd6950@brauner>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304-iino-u64-v3-0-2257ad83d372@kernel.org>
References: <20260304-iino-u64-v3-0-2257ad83d372@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2708; i=brauner@kernel.org;
 h=from:subject:message-id; bh=7RvOdnrFs/iEe9G84pPe+q4PLv+gFd3Sa58Nl0eTC8M=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSumvWu2uNxbBFXikaZQKrMtl0PLj1c+kZGWOrvZiHz/
 W/CTGOed5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzk4A5GhimT869vPnNH4Vqj
 t6Tr0fqPLXs3v0g/qbXpwf6o52L5D7YyMnxU+idovG+O5JQe0WVOK45/sI9bw9AjJfah78/izrQ
 aXg4A
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 04 Mar 2026 10:32:30 -0500,
 Jeff Layton wrote: > Christian
 said [1] to "just do it" when I proposed this,
 so here we are! > > For historical
 reasons, the inode->i_ino field is an unsigned long [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vyRH8-0003tq-7o
Subject: Re: [f2fs-dev] [PATCH v3 00/12] vfs: change inode->i_ino from
 unsigned long to u64
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Paulo Alcantara <pc@manguebit.org>, "Darrick J. Wong" <djwong@kernel.org>,
 Anders Larsen <al@alarsen.net>, dri-devel@lists.freedesktop.org,
 linux-sctp@vger.kernel.org, linux-hams@vger.kernel.org,
 ceph-devel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Fan Wu <wufan@kernel.org>,
 Xin Long <lucien.xin@gmail.com>, James Morris <jmorris@namei.org>,
 Tyler Hicks <code@tyhicks.com>, Eric Biggers <ebiggers@kernel.org>,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Martin Schiller <ms@dev.tdt.de>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Willem de Bruijn <willemb@google.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, linux-fscrypt@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Hildenbrand <david@kernel.org>, Eric Van Hensbergen <ericvh@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Christian Brauner <brauner@kernel.org>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Paris <eparis@redhat.com>, linux-perf-users@vger.kernel.org,
 David Ahern <dsahern@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-media@vger.kernel.org, Trond Myklebust <trondmy@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Dave Kleikamp <shaggy@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Oleg Nesterov <oleg@redhat.com>,
 Eric Dumazet <edumazet@google.com>, Alex Deucher <alexander.deucher@amd.com>,
 Johan Hedberg <johan.hedberg@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-cifs@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>,
 linux-nilfs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 "David S. Miller" <davem@davemloft.net>,
 John Fastabend <john.fastabend@gmail.com>, Joerg Reuter <jreuter@yaina.de>,
 codalist@coda.cs.cmu.edu, Remi Denis-Courmont <courmisch@gmail.com>,
 linux-trace-kernel@vger.kernel.org, Olga Kornievskaia <okorniev@redhat.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Yangtao Li <frank.li@vivo.com>, selinux@vger.kernel.org,
 linux-can@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 ocfs2-devel@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>,
 fsverity@lists.linux.dev, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Nicolas Pitre <nico@fluxnic.net>, Muchun Song <muchun.song@linux.dev>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net, Anna Schumaker <anna@kernel.org>,
 linux-integrity@vger.kernel.org,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Alex Markuze <amarkuze@redhat.com>, Martin Brandenburg <martin@omnibond.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexander Aring <alex.aring@gmail.com>, linux-mtd@lists.infradead.org,
 Marc Dionne <marc.dionne@auristor.com>, Neal Cardwell <ncardwell@google.com>,
 linux-afs@lists.infradead.org, Ian Kent <raven@themaw.net>,
 Naohiro Aota <naohiro.aota@wdc.com>, Christoph Hellwig <hch@infradead.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Miklos Szeredi <miklos@szeredi.hu>,
 amd-gfx@lists.freedesktop.org, coda@cs.cmu.edu,
 Stanislav Fomichev <sdf@fomichev.me>, Viacheslav Dubeyko <slava@dubeyko.com>,
 NeilBrown <neil@brown.name>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>,
 Amir Goldstein <amir73il@gmail.com>, James Clark <james.clark@linaro.org>,
 autofs@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Damien Le Moal <dlemoal@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>,
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-nfs@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Casey Schaufler <casey@schaufler-ca.com>, samba-technical@lists.samba.org,
 Ondrej Mosnacek <omosnace@redhat.com>, Steve French <sfrench@samba.org>,
 Oliver Hartkopp <socketcan@hartkopp.net>, netfs@lists.linux.dev,
 bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ian Rogers <irogers@google.com>, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, Peter Zijlstra <peterz@infradead.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Adrian Hunter <adrian.hunter@intel.com>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 David Airlie <airlied@gmail.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Eric Snowberg <eric.snowberg@oracle.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-x25@vger.kernel.org,
 audit@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Salah Triki <salah.triki@gmail.com>, Marcel Holtmann <marcel@holtmann.org>,
 Simon Horman <horms@kernel.org>, ecryptfs@vger.kernel.org,
 apparmor@lists.ubuntu.com, Tom Talpey <tom@talpey.com>,
 Bharath SM <bharathsm@microsoft.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Namhyung Kim <namhyung@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 John Johansen <john.johansen@canonical.com>,
 Luis de Bethencourt <luisbg@kernel.org>, netdev@vger.kernel.org,
 v9fs@lists.linux.dev, linux-unionfs@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 2009C21DB9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ionkov.net,lists.linux.dev,paragon-software.com,manguebit.org,kernel.org,alarsen.net,lists.freedesktop.org,vger.kernel.org,omnibond.com,gmail.com,namei.org,tyhicks.com,lists.orangefs.org,microsoft.com,dev.tdt.de,google.com,zeniv.linux.org.uk,physik.fu-berlin.de,intel.com,redhat.com,oracle.com,suse.com,arm.com,linux.ibm.com,amd.com,ffwll.ch,paul-moore.com,davemloft.net,yaina.de,coda.cs.cmu.edu,vivo.com,lists.linaro.org,mit.edu,fluxnic.net,linux.dev,huawei.com,lists.sourceforge.net,linux.intel.com,lists.infradead.org,auristor.com,themaw.net,wdc.com,infradead.org,iogearbox.net,szeredi.hu,cs.cmu.edu,fomichev.me,dubeyko.com,brown.name,hallyn.com,linaro.org,goodmis.org,efficios.com,suse.de,linux.alibaba.com,schaufler-ca.com,lists.samba.org,samba.org,hartkopp.net,suse.cz,codewreck.org,crudebyte.com,kvack.org,dilger.ca,artax.karlin.mff.cuni.cz,secunet.com,gondor.apana.org.au,nod.at,fasheh.com,holtmann.org,lists.ubuntu.com,talpey.com,pengutronix.de,canonical.com,evilplan.or
 g];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[169];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[brauner@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On Wed, 04 Mar 2026 10:32:30 -0500, Jeff Layton wrote:
> Christian said [1] to "just do it" when I proposed this, so here we are!
> 
> For historical reasons, the inode->i_ino field is an unsigned long,
> which means that it's 32 bits on 32 bit architectures. This has caused a
> number of filesystems to implement hacks to hash a 64-bit identifier
> into a 32-bit field, and deprives us of a universal identifier field for
> an inode.
> 
> [...]

This series makes me happy. We've been talking about this conversion for
a while and I'm thankful that you did this work. Without the automation
available this probably wouldn't have happened as quickly as it did now.
Let's see what bits and pieces it missed.

---

Applied to the vfs-7.1.kino branch of the vfs/vfs.git tree.
Patches in the vfs-7.1.kino branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-7.1.kino

[01/12] vfs: widen inode hash/lookup functions to u64
        https://git.kernel.org/vfs/vfs/c/2412a9fa518a
[02/12] audit: widen ino fields to u64
        https://git.kernel.org/vfs/vfs/c/a5e863be4d02
[03/12] net: change sock.sk_ino and sock_i_ino() to u64
        https://git.kernel.org/vfs/vfs/c/c21144a0a33f
[04/12] vfs: widen trace event i_ino fields to u64
        https://git.kernel.org/vfs/vfs/c/5e5c380870b2
[05/12] cachefiles: widen trace event i_ino fields to u64
        https://git.kernel.org/vfs/vfs/c/25291f67aad7
[06/12] ext2: widen trace event i_ino fields to u64
        https://git.kernel.org/vfs/vfs/c/797d04a355e3
[07/12] hugetlbfs: widen trace event i_ino fields to u64
        https://git.kernel.org/vfs/vfs/c/3c976fb36a9a
[08/12] zonefs: widen trace event i_ino fields to u64
        https://git.kernel.org/vfs/vfs/c/988f68c01b3a
[09/12] ext4: widen trace event i_ino fields to u64
        https://git.kernel.org/vfs/vfs/c/1c1427c79bc2
[10/12] f2fs: widen trace event i_ino fields to u64
        https://git.kernel.org/vfs/vfs/c/6e62bf74bd8a
[11/12] nilfs2: widen trace event i_ino fields to u64
        https://git.kernel.org/vfs/vfs/c/6ce73711525a
[12/12] treewide: change inode->i_ino from unsigned long to u64
        https://git.kernel.org/vfs/vfs/c/af82d143e869


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
