Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iA6XIrz0pWl5IQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:36:12 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B95671DFD9A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:36:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4HtqvQuTi6gUf0Z0ar4uw4rcDMZ3W+oI1fcJfa/7G0=; b=T+s0yQF7u3+l1U1ZsnTXCQawGo
	B4M+CQVrhSByJ3SK+zuyn4d0UtCuvtQ08hJ9b0fbK1ESPx00g/5pYsBA/QGs6Qj55HGpOAZjw2z7q
	rgeVWM1ya8I+MNGIfV4oXMBcxyFPsK75NsCCq0s9bBwfwfTsDYUD1U9Xu/OKwQwNl7gI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vx9zu-0002tj-D8;
	Mon, 02 Mar 2026 20:36:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vx9zs-0002tJ-Pf;
 Mon, 02 Mar 2026 20:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GtBwFCmTOtYrZVX2ZfDd0HFcsutrtkdY7SKo4Y8xCEI=; b=hX8L6+YF2jpApdYNC13kkFD7BV
 I2K7CXWclodmChL9Yb8aqRQUbdwkxe5RcL0gg81X4NKLxxNxHVgCg+i56ZLaGSsmb09O8ZuJ10CQy
 /R5cQz2wlgvRH71BStfx7GMF0hIrmcsbsn1HmpTh5WoFfT6B5vM6ObUn3lC06DJAempQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GtBwFCmTOtYrZVX2ZfDd0HFcsutrtkdY7SKo4Y8xCEI=; b=ShNzgAW/SpSpWkB6sXd5KOtGcO
 Qi8UUMqdt0zV1EjMnBs20myK0rUqAQG8bs4DfY+DImIv7uec1i9Kz4UzzaNQJWxzejRZOiKm6YRxF
 zbwKrWCmI171jlOoeiDVIbF7XwbSMun3WzCys7uLLbRSIo0CdSdY/Gen+R6kEIQH8wwo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vx9zr-0005cc-N1; Mon, 02 Mar 2026 20:36:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5491D43B42;
 Mon,  2 Mar 2026 20:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0873CC2BCB5;
 Mon,  2 Mar 2026 20:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772483762;
 bh=ERGVnc/eNvk3T/zuaFFuXcHD9EL1GuErviurDex5W4o=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=REYuvFsDDR+oxBK7+A0CfVNiADY41vFTKoKcokLx+U/4MauiWmR5IPgW1ys7G/NW0
 loEvYpig71yLk0MwJ0ymDsMR98bBIpzDrWen0Tw54b7bCP/xbmKsKGfH9coaRp/18y
 Eo0H6ZGp5Ty/7F7rwpR4r+Hx2H0nZLg+fbnV+iiEv5zC6whurjOhbHJHY3KZ17yzlS
 XKpFn831tIVJfa3gRbLsfyQ4ot+jkdGNv2F60iwxRINAN0TQk+lIUPAd1iK7ktRn3M
 O0XnapSqAqCnsDUZsfqS8R2J6JsY/rdYoLvxzMnEaMALXPuXaWeiy70Wdi10ERpMSm
 X3mDLx+Xd6KIw==
Date: Mon, 02 Mar 2026 15:24:30 -0500
MIME-Version: 1.0
Message-Id: <20260302-iino-u64-v2-46-e5388800dae0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9467; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=ERGVnc/eNvk3T/zuaFFuXcHD9EL1GuErviurDex5W4o=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBppfH7+07vkyyUMJ8L7y9+mlPY4jMzb+NyG+v/R
 pgBoyVgEcOJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaXx+wAKCRAADmhBGVaC
 FfZHEADJ/fjGrDSfQhhbluCM8cNtkizM9fG4iQpD1GJd8F6pckX2OF3puZnuhvDvkJx1GrSQGpf
 QW/yi7pUzSsl5pmkzn8cPf0XOVnw/HrW30iy7qftMlY1u4pe2cGXaxj9L5mEwIF3RaXpFvqiU45
 812ILv/xFfAB+tE0lLgn8azq/WMlHUpMUdDxjKutRWykRDMjdYLNd7xsS1Iv/C4J3qmMZGBCPhW
 oJ4fdndEf8wcBjyb2ZakJRWtI5/6KqcytqeHHnC3Hf8MxGbSEoxP+U+AfYMb6Up7xG4/BZJIoqu
 NH0S4x6NhuPkIz7iKLoyYpNPaCfjTBfW32smIeAFg1dmNWBaSxFLsp7I1sW9MCTU7GjwT3kJB0e
 RqzRBjmuIMay1eqHOGoO3jQAhchsuDJ/RKxnWofZPYIQQAKLDB+w4DwT6sAHBFBtJt3Pog1XFGw
 0fFbFLdIOZhBnJoWN6O2n+BW8auYit7amRfHOQcyREVzZhFGjJdwruGm0vXmoCfUMBgecY1Josh
 1sot2IriM7ar0A+xdl7wMN74Fer508nUbS76dwwBz+KNC8OTHje4X5uWQXE/XzBqXWeuFRgYK6E
 qTaGyUMzpjWB2HiLSpxSKYcyu6wLbgTYgBtGNMo2HR2W4GR5ZXkfdtWbSGi6w3i4eZ2BwxyF6NW
 i6WIlbxHST3GYpA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert udf i_ino format strings to use the PRIino format
 macro in preparation for the widening of i_ino via kino_t. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/udf/directory.c | 18
 +++++++++---------
 fs/udf/file.c | 2 +- fs/udf/inode.c | 12 ++++++------ fs/udf/namei.c | 8
 ++++---- fs/udf/super.c | 2 +- 5 [...] 
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
X-Headers-End: 1vx9zr-0005cc-N1
Subject: [f2fs-dev] [PATCH v2 046/110] udf: use PRIino format for i_ino
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
X-Rspamd-Queue-Id: B95671DFD9A
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

Convert udf i_ino format strings to use the PRIino format
macro in preparation for the widening of i_ino via kino_t.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/udf/directory.c | 18 +++++++++---------
 fs/udf/file.c      |  2 +-
 fs/udf/inode.c     | 12 ++++++------
 fs/udf/namei.c     |  8 ++++----
 fs/udf/super.c     |  2 +-
 5 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/fs/udf/directory.c b/fs/udf/directory.c
index 632453aa38934a0b58b420717ec0674c85627ce5..c825e11c017f652500a3dfc83905679ef86ec570 100644
--- a/fs/udf/directory.c
+++ b/fs/udf/directory.c
@@ -22,7 +22,7 @@ static int udf_verify_fi(struct udf_fileident_iter *iter)
 
 	if (iter->fi.descTag.tagIdent != cpu_to_le16(TAG_IDENT_FID)) {
 		udf_err(iter->dir->i_sb,
-			"directory (ino %lu) has entry at pos %llu with incorrect tag %x\n",
+			"directory (ino %" PRIino "u) has entry at pos %llu with incorrect tag %x\n",
 			iter->dir->i_ino, (unsigned long long)iter->pos,
 			le16_to_cpu(iter->fi.descTag.tagIdent));
 		return -EFSCORRUPTED;
@@ -30,7 +30,7 @@ static int udf_verify_fi(struct udf_fileident_iter *iter)
 	len = udf_dir_entry_len(&iter->fi);
 	if (le16_to_cpu(iter->fi.lengthOfImpUse) & 3) {
 		udf_err(iter->dir->i_sb,
-			"directory (ino %lu) has entry at pos %llu with unaligned length of impUse field\n",
+			"directory (ino %" PRIino "u) has entry at pos %llu with unaligned length of impUse field\n",
 			iter->dir->i_ino, (unsigned long long)iter->pos);
 		return -EFSCORRUPTED;
 	}
@@ -41,20 +41,20 @@ static int udf_verify_fi(struct udf_fileident_iter *iter)
 	 */
 	if (len > 1 << iter->dir->i_blkbits) {
 		udf_err(iter->dir->i_sb,
-			"directory (ino %lu) has too big (%u) entry at pos %llu\n",
+			"directory (ino %" PRIino "u) has too big (%u) entry at pos %llu\n",
 			iter->dir->i_ino, len, (unsigned long long)iter->pos);
 		return -EFSCORRUPTED;
 	}
 	if (iter->pos + len > iter->dir->i_size) {
 		udf_err(iter->dir->i_sb,
-			"directory (ino %lu) has entry past directory size at pos %llu\n",
+			"directory (ino %" PRIino "u) has entry past directory size at pos %llu\n",
 			iter->dir->i_ino, (unsigned long long)iter->pos);
 		return -EFSCORRUPTED;
 	}
 	if (udf_dir_entry_len(&iter->fi) !=
 	    sizeof(struct tag) + le16_to_cpu(iter->fi.descTag.descCRCLength)) {
 		udf_err(iter->dir->i_sb,
-			"directory (ino %lu) has entry where CRC length (%u) does not match entry length (%u)\n",
+			"directory (ino %" PRIino "u) has entry where CRC length (%u) does not match entry length (%u)\n",
 			iter->dir->i_ino,
 			(unsigned)le16_to_cpu(iter->fi.descTag.descCRCLength),
 			(unsigned)(udf_dir_entry_len(&iter->fi) -
@@ -78,7 +78,7 @@ static int udf_copy_fi(struct udf_fileident_iter *iter)
 	}
 	if (iter->dir->i_size < iter->pos + sizeof(struct fileIdentDesc)) {
 		udf_err(iter->dir->i_sb,
-			"directory (ino %lu) has entry straddling EOF\n",
+			"directory (ino %" PRIino "u) has entry straddling EOF\n",
 			iter->dir->i_ino);
 		return -EFSCORRUPTED;
 	}
@@ -184,7 +184,7 @@ static int udf_fiiter_advance_blk(struct udf_fileident_iter *iter)
 			return 0;
 		}
 		udf_err(iter->dir->i_sb,
-			"extent after position %llu not allocated in directory (ino %lu)\n",
+			"extent after position %llu not allocated in directory (ino %" PRIino "u)\n",
 			(unsigned long long)iter->pos, iter->dir->i_ino);
 		return -EFSCORRUPTED;
 	}
@@ -272,7 +272,7 @@ int udf_fiiter_init(struct udf_fileident_iter *iter, struct inode *dir,
 		if (pos == dir->i_size)
 			return 0;
 		udf_err(dir->i_sb,
-			"position %llu not allocated in directory (ino %lu)\n",
+			"position %llu not allocated in directory (ino %" PRIino "u)\n",
 			(unsigned long long)pos, dir->i_ino);
 		err = -EFSCORRUPTED;
 		goto out;
@@ -483,7 +483,7 @@ int udf_fiiter_append_blk(struct udf_fileident_iter *iter)
 		   &iter->loffset, &etype);
 	if (err <= 0 || etype != (EXT_RECORDED_ALLOCATED >> 30)) {
 		udf_err(iter->dir->i_sb,
-			"block %llu not allocated in directory (ino %lu)\n",
+			"block %llu not allocated in directory (ino %" PRIino "u)\n",
 			(unsigned long long)block, iter->dir->i_ino);
 		return -EFSCORRUPTED;
 	}
diff --git a/fs/udf/file.c b/fs/udf/file.c
index 32ae7cfd72c549958b70824b449cf146f6750f44..ab8093b87dc8f21ce8af6a72621e2868fb4b9a82 100644
--- a/fs/udf/file.c
+++ b/fs/udf/file.c
@@ -133,7 +133,7 @@ long udf_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	int result;
 
 	if (file_permission(filp, MAY_READ) != 0) {
-		udf_debug("no permission to access inode %lu\n", inode->i_ino);
+		udf_debug("no permission to access inode %" PRIino "u\n", inode->i_ino);
 		return -EPERM;
 	}
 
diff --git a/fs/udf/inode.c b/fs/udf/inode.c
index 7fae8002344a0e1e7e51022e97f1e0e2424185f9..ecc22aded0d287ccdfb34b42a0d82e392054f585 100644
--- a/fs/udf/inode.c
+++ b/fs/udf/inode.c
@@ -147,7 +147,7 @@ void udf_evict_inode(struct inode *inode)
 		if (iinfo->i_alloc_type != ICBTAG_FLAG_AD_IN_ICB &&
 		    inode->i_size != iinfo->i_lenExtents) {
 			udf_warn(inode->i_sb,
-				 "Inode %lu (mode %o) has inode size %llu different from extent length %llu. Filesystem need not be standards compliant.\n",
+				 "Inode %" PRIino "u (mode %o) has inode size %llu different from extent length %llu. Filesystem need not be standards compliant.\n",
 				 inode->i_ino, inode->i_mode,
 				 (unsigned long long)inode->i_size,
 				 (unsigned long long)iinfo->i_lenExtents);
@@ -1386,13 +1386,13 @@ static int udf_read_inode(struct inode *inode, bool hidden_inode)
 	 */
 	bh = udf_read_ptagged(inode->i_sb, iloc, 0, &ident);
 	if (!bh) {
-		udf_err(inode->i_sb, "(ino %lu) failed !bh\n", inode->i_ino);
+		udf_err(inode->i_sb, "(ino %" PRIino "u) failed !bh\n", inode->i_ino);
 		return -EIO;
 	}
 
 	if (ident != TAG_IDENT_FE && ident != TAG_IDENT_EFE &&
 	    ident != TAG_IDENT_USE) {
-		udf_err(inode->i_sb, "(ino %lu) failed ident=%u\n",
+		udf_err(inode->i_sb, "(ino %" PRIino "u) failed ident=%u\n",
 			inode->i_ino, ident);
 		goto out;
 	}
@@ -1641,7 +1641,7 @@ static int udf_read_inode(struct inode *inode, bool hidden_inode)
 		udf_debug("METADATA BITMAP FILE-----\n");
 		break;
 	default:
-		udf_err(inode->i_sb, "(ino %lu) failed unknown file type=%u\n",
+		udf_err(inode->i_sb, "(ino %" PRIino "u) failed unknown file type=%u\n",
 			inode->i_ino, fe->icbTag.fileType);
 		goto out;
 	}
@@ -1942,7 +1942,7 @@ static int udf_update_inode(struct inode *inode, int do_sync)
 	if (do_sync) {
 		sync_dirty_buffer(bh);
 		if (buffer_write_io_error(bh)) {
-			udf_warn(inode->i_sb, "IO error syncing udf inode [%08lx]\n",
+			udf_warn(inode->i_sb, "IO error syncing udf inode [%08" PRIino "x]\n",
 				 inode->i_ino);
 			err = -EIO;
 		}
@@ -2224,7 +2224,7 @@ int udf_next_aext(struct inode *inode, struct extent_position *epos,
 
 		if (++indirections > UDF_MAX_INDIR_EXTS) {
 			udf_err(inode->i_sb,
-				"too many indirect extents in inode %lu\n",
+				"too many indirect extents in inode %" PRIino "u\n",
 				inode->i_ino);
 			return -EFSCORRUPTED;
 		}
diff --git a/fs/udf/namei.c b/fs/udf/namei.c
index 5f2e9a892bffa9579143cedf71d80efa7ad6e9fb..32209549a31f451a486918e673a41497bef42e89 100644
--- a/fs/udf/namei.c
+++ b/fs/udf/namei.c
@@ -550,7 +550,7 @@ static int udf_unlink(struct inode *dir, struct dentry *dentry)
 		goto end_unlink;
 
 	if (!inode->i_nlink) {
-		udf_debug("Deleting nonexistent file (%lu), %u\n",
+		udf_debug("Deleting nonexistent file (%" PRIino "u), %u\n",
 			  inode->i_ino, inode->i_nlink);
 		set_nlink(inode, 1);
 	}
@@ -809,7 +809,7 @@ static int udf_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 					       &diriter);
 		if (retval == -ENOENT) {
 			udf_err(old_inode->i_sb,
-				"directory (ino %lu) has no '..' entry\n",
+				"directory (ino %" PRIino "u) has no '..' entry\n",
 				old_inode->i_ino);
 			retval = -EFSCORRUPTED;
 		}
@@ -821,7 +821,7 @@ static int udf_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 				old_dir->i_ino) {
 			retval = -EFSCORRUPTED;
 			udf_err(old_inode->i_sb,
-				"directory (ino %lu) has parent entry pointing to another inode (%lu != %u)\n",
+				"directory (ino %" PRIino "u) has parent entry pointing to another inode (%" PRIino "u != %u)\n",
 				old_inode->i_ino, old_dir->i_ino,
 				udf_get_lb_pblock(old_inode->i_sb, &tloc, 0));
 			goto out_oiter;
@@ -869,7 +869,7 @@ static int udf_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	retval = udf_fiiter_find_entry(old_dir, &old_dentry->d_name, &oiter);
 	if (retval) {
 		udf_err(old_dir->i_sb,
-			"failed to find renamed entry again in directory (ino %lu)\n",
+			"failed to find renamed entry again in directory (ino %" PRIino "u)\n",
 			old_dir->i_ino);
 	} else {
 		udf_fiiter_delete_entry(&oiter);
diff --git a/fs/udf/super.c b/fs/udf/super.c
index 27f463fd1d89e8ae4844cd70c291d737aee1589e..c6e372d573885742745d3ff4b3b017facf228a32 100644
--- a/fs/udf/super.c
+++ b/fs/udf/super.c
@@ -1166,7 +1166,7 @@ static int udf_fill_partdesc_info(struct super_block *sb,
 		}
 		map->s_uspace.s_table = inode;
 		map->s_partition_flags |= UDF_PART_FLAG_UNALLOC_TABLE;
-		udf_debug("unallocSpaceTable (part %d) @ %lu\n",
+		udf_debug("unallocSpaceTable (part %d) @ %" PRIino "u\n",
 			  p_index, map->s_uspace.s_table->i_ino);
 	}
 

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
