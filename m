Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHdMCAXFpmn3TQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Mar 2026 12:24:53 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2A41EDB48
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Mar 2026 12:24:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzJJkoJFnqNV4hipZE3MNkYOwUXwYpRQ93AAgxFPuRU=; b=QDCm8zjqK5jSOLCI+gGRTnrSY4
	l4m0TrMUKrvfxfieMo4y/TVCEgbBaLv7oP9VMKxB21fdH0FjDNvqqbPSWYKL5bAZKaMLYr4v53oLs
	HF+JVGDi2Qopvo7hKklT/hiNmjtf9cBZWh2Y+X4YRtgWIRAspPFFC6LYXmuHPr/5erFQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxNru-0001ku-O1;
	Tue, 03 Mar 2026 11:24:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vxNrt-0001ko-D6
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Mar 2026 11:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vDQHJTybbwme79tj0LaoGJ3bxXhb6k+U6EpthuA22eM=; b=EgXKN9sXtgtDNIfTdpdRuCB5wX
 Z4W8Y+FJaaMCD+rFjV5EEI1cc3ui25uGApdF5rF14mIVfmpf3G7XdYf0ovVjARFsMDEHrxcflNmiF
 TEGFQwy/NlG3EVDwrM42aW0QbByV9K/Sd27tP6PyoBps+j6xqBQKeg5RsPSjRLCUy6qo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vDQHJTybbwme79tj0LaoGJ3bxXhb6k+U6EpthuA22eM=; b=AFWKQ6b52kTWlGA0TI7w6OBMes
 57HSvfpLv+iZTMqUAi14W3LUMqXdFxSCHMcKzJ2Re2TxAJUdszc3G50Gxa525yzdsmn8HauyRYgnC
 XlBXSBVZ/Ah5mrLmU6xWfrk3xv3aFkmbzgwNVEFIIaaqoXLkh6TO4xdnCaswpURD4YDo=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vxNrs-0003kI-IN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Mar 2026 11:24:49 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 18CC35BD1C;
 Tue,  3 Mar 2026 11:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772537077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vDQHJTybbwme79tj0LaoGJ3bxXhb6k+U6EpthuA22eM=;
 b=UoWJ+20FudPqog6nxHkr+fdHi2sJkTvwHuu+U6kuvo8gTTWmh/AlFpBu94vJwGOq83XWlO
 SWRBZty/CKQ0hlfQ+lZ8gNI3kKqwwsJ/Lu5UnE5LBFMyAaA3/uvcm0WcVYOvdRBJtXQ4CA
 ohEwDdk4ePzsFvbqpNx8CmCIILQIl8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772537077;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vDQHJTybbwme79tj0LaoGJ3bxXhb6k+U6EpthuA22eM=;
 b=Q6oUQTudfBrS7v+5ldwHSD1RVeupUKkxjY+tqUelutQ+f0ackTTzkSKTR5cBNAJo7Ebnpa
 K1UfuCNCKIm02nCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772537077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vDQHJTybbwme79tj0LaoGJ3bxXhb6k+U6EpthuA22eM=;
 b=UoWJ+20FudPqog6nxHkr+fdHi2sJkTvwHuu+U6kuvo8gTTWmh/AlFpBu94vJwGOq83XWlO
 SWRBZty/CKQ0hlfQ+lZ8gNI3kKqwwsJ/Lu5UnE5LBFMyAaA3/uvcm0WcVYOvdRBJtXQ4CA
 ohEwDdk4ePzsFvbqpNx8CmCIILQIl8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772537077;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vDQHJTybbwme79tj0LaoGJ3bxXhb6k+U6EpthuA22eM=;
 b=Q6oUQTudfBrS7v+5ldwHSD1RVeupUKkxjY+tqUelutQ+f0ackTTzkSKTR5cBNAJo7Ebnpa
 K1UfuCNCKIm02nCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0470A3EA69;
 Tue,  3 Mar 2026 11:24:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WHkSAfXEpmlOSgAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 03 Mar 2026 11:24:37 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id BC159A0A1B; Tue,  3 Mar 2026 12:24:36 +0100 (CET)
Date: Tue, 3 Mar 2026 12:24:36 +0100
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <4sefbdgtlxnclmqd5drtyk7k7iixheqrkxambzoazpc5wjbaad@z4djfmeum5ks>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
 <20260302-iino-u64-v2-34-e5388800dae0@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260302-iino-u64-v2-34-e5388800dae0@kernel.org>
X-Spam-Flag: NO
X-Spam-Score: -0.30
X-Spam-Level: 
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 02-03-26 15:24:18, Jeff Layton wrote: > Convert isofs
 i_ino format strings to use the PRIino format > macro in preparation for
 the widening of i_ino via kino_t. > > Also correct signed format s [...] 
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
X-Headers-End: 1vxNrs-0003kI-IN
Subject: Re: [f2fs-dev] [PATCH v2 034/110] isofs: use PRIino format for i_ino
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>, "Darrick J. Wong" <djwong@kernel.org>,
 Anders Larsen <al@alarsen.net>, dri-devel@lists.freedesktop.org,
 linux-sctp@vger.kernel.org, linux-hams@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Fan Wu <wufan@kernel.org>,
 Xin Long <lucien.xin@gmail.com>, ceph-devel@vger.kernel.org,
 James Morris <jmorris@namei.org>, Tyler Hicks <code@tyhicks.com>,
 Christoph Hellwig <hch@infradead.org>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Martin Schiller <ms@dev.tdt.de>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Willem de Bruijn <willemb@google.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-fscrypt@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Hildenbrand <david@kernel.org>, Eric Van Hensbergen <ericvh@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Christian Brauner <brauner@kernel.org>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Paris <eparis@redhat.com>, linux-perf-users@vger.kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org,
 Trond Myklebust <trondmy@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Dave Kleikamp <shaggy@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Oleg Nesterov <oleg@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Johan Hedberg <johan.hedberg@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-cifs@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>,
 linux-nilfs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 John Fastabend <john.fastabend@gmail.com>, codalist@coda.cs.cmu.edu,
 Remi Denis-Courmont <courmisch@gmail.com>, linux-trace-kernel@vger.kernel.org,
 Olga Kornievskaia <okorniev@redhat.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Yangtao Li <frank.li@vivo.com>, selinux@vger.kernel.org, v9fs@lists.linux.dev,
 linux-can@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Casey Schaufler <casey@schaufler-ca.com>, netfs@lists.linux.dev,
 Jaegeuk Kim <jaegeuk@kernel.org>, fsverity@lists.linux.dev,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Nicolas Pitre <nico@fluxnic.net>,
 Muchun Song <muchun.song@linux.dev>, Roberto Sassu <roberto.sassu@huawei.com>,
 "David S. Miller" <davem@davemloft.net>, Anna Schumaker <anna@kernel.org>,
 linux-integrity@vger.kernel.org,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Alex Markuze <amarkuze@redhat.com>, Martin Brandenburg <martin@omnibond.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 ocfs2-devel@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
 linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Marc Dionne <marc.dionne@auristor.com>, Neal Cardwell <ncardwell@google.com>,
 linux-afs@lists.infradead.org, Ian Kent <raven@themaw.net>,
 Naohiro Aota <naohiro.aota@wdc.com>, Eric Biggers <ebiggers@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Miklos Szeredi <miklos@szeredi.hu>,
 Matthew Wilcox <willy@infradead.org>, coda@cs.cmu.edu,
 Stanislav Fomichev <sdf@fomichev.me>, Viacheslav Dubeyko <slava@dubeyko.com>,
 NeilBrown <neil@brown.name>, Ilya Dryomov <idryomov@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, jfs-discussion@lists.sourceforge.net,
 "Serge E. Hallyn" <serge@hallyn.com>, Amir Goldstein <amir73il@gmail.com>,
 James Clark <james.clark@linaro.org>, autofs@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Damien Le Moal <dlemoal@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 samba-technical@lists.samba.org, Ondrej Mosnacek <omosnace@redhat.com>,
 Steve French <sfrench@samba.org>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Ian Rogers <irogers@google.com>, Alexander Aring <alex.aring@gmail.com>,
 Jan Kara <jack@suse.cz>, Peter Zijlstra <peterz@infradead.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, ecryptfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 linux-f2fs-devel@lists.sourceforge.net, David Airlie <airlied@gmail.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Eric Snowberg <eric.snowberg@oracle.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-x25@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Salah Triki <salah.triki@gmail.com>, Marcel Holtmann <marcel@holtmann.org>,
 Joerg Reuter <jreuter@yaina.de>, Simon Horman <horms@kernel.org>,
 apparmor@lists.ubuntu.com, Tom Talpey <tom@talpey.com>,
 Bharath SM <bharathsm@microsoft.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Namhyung Kim <namhyung@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 John Johansen <john.johansen@canonical.com>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Oliver Hartkopp <socketcan@hartkopp.net>, David Ahern <dsahern@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 3F2A41EDB48
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jlayton@kernel.org,m:lucho@ionkov.net,m:nvdimm@lists.linux.dev,m:pc@manguebit.org,m:djwong@kernel.org,m:al@alarsen.net,m:dri-devel@lists.freedesktop.org,m:linux-sctp@vger.kernel.org,m:linux-hams@vger.kernel.org,m:sumit.semwal@linaro.org,m:hubcap@omnibond.com,m:linux-xfs@vger.kernel.org,m:wufan@kernel.org,m:lucien.xin@gmail.com,m:ceph-devel@vger.kernel.org,m:jmorris@namei.org,m:code@tyhicks.com,m:hch@infradead.org,m:devel@lists.orangefs.org,m:sprasad@microsoft.com,m:ms@dev.tdt.de,m:hawk@kernel.org,m:jaharkes@cs.cmu.edu,m:willemb@google.com,m:acme@kernel.org,m:linux-fscrypt@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:david@kernel.org,m:ericvh@kernel.org,m:magnus.karlsson@intel.com,m:brauner@kernel.org,m:dmitry.kasatkin@gmail.com,m:stephen.smalley.work@gmail.com,m:linux-kernel@vger.kernel.org,m:eparis@redhat.com,m:linux-perf-users@vger.kernel.org,m:chuck.lever@oracle.com,m:mhiramat@kernel.org,m:jolsa@ke
 rnel.org,m:jack@suse.com,m:alexander.deucher@amd.com,m:linux-media@vger.kernel.org,m:trondmy@kernel.org,m:mark.rutland@arm.com,m:shaggy@kernel.org,m:zohar@linux.ibm.com,m:oleg@redhat.com,m:edumazet@google.com,m:johan.hedberg@gmail.com,m:simona@ffwll.ch,m:linux-cifs@vger.kernel.org,m:kuniyu@google.com,m:linux-nilfs@vger.kernel.org,m:paul@paul-moore.com,m:john.fastabend@gmail.com,m:codalist@coda.cs.cmu.edu,m:courmisch@gmail.com,m:linux-trace-kernel@vger.kernel.org,m:okorniev@redhat.com,m:maciej.fijalkowski@intel.com,m:frank.li@vivo.com,m:selinux@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-can@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:casey@schaufler-ca.com,m:netfs@lists.linux.dev,m:jaegeuk@kernel.org,m:fsverity@lists.linux.dev,m:tytso@mit.edu,m:nico@fluxnic.net,m:muchun.song@linux.dev,m:roberto.sassu@huawei.com,m:davem@davemloft.net,m:anna@kernel.org,m:linux-integrity@vger.kernel.org,m:marcelo.leitner@gmail.com,m:luiz.dentz@gmail.com,m:amarkuze@redhat.com,m:martin@omnibond
 .com,m:alexander.shishkin@linux.intel.com,m:ocfs2-devel@lists.linux.dev,m:ast@kernel.org,m:linux-mtd@lists.infradead.org,m:amd-gfx@lists.freedesktop.org,m:marc.dionne@auristor.com,m:ncardwell@google.com,m:linux-afs@lists.infradead.org,m:raven@themaw.net,m:naohiro.aota@wdc.com,m:ebiggers@kernel.org,m:daniel@iogearbox.net,m:miklos@szeredi.hu,m:willy@infradead.org,m:coda@cs.cmu.edu,m:sdf@fomichev.me,m:slava@dubeyko.com,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.cz:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	RCPT_COUNT_GT_50(0.00)[170];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[ionkov.net,lists.linux.dev,manguebit.org,kernel.org,alarsen.net,lists.freedesktop.org,vger.kernel.org,linaro.org,omnibond.com,gmail.com,namei.org,tyhicks.com,infradead.org,lists.orangefs.org,microsoft.com,dev.tdt.de,cs.cmu.edu,google.com,zeniv.linux.org.uk,physik.fu-berlin.de,intel.com,redhat.com,oracle.com,suse.com,amd.com,arm.com,linux.ibm.com,ffwll.ch,paul-moore.com,coda.cs.cmu.edu,vivo.com,lists.linaro.org,schaufler-ca.com,mit.edu,fluxnic.net,linux.dev,huawei.com,davemloft.net,linux.intel.com,lists.infradead.org,auristor.com,themaw.net,wdc.com,iogearbox.net,szeredi.hu,fomichev.me,dubeyko.com,brown.name,lists.sourceforge.net,hallyn.com,goodmis.org,efficios.com,suse.de,paragon-software.com,kvack.org,lists.samba.org,samba.org,suse.cz,codewreck.org,crudebyte.com,linux.alibaba.com,dilger.ca,artax.karlin.mff.cuni.cz,secunet.com,gondor.apana.org.au,nod.at,fasheh.com,holtmann.org,yaina.de,lists.ubuntu.com,talpey.com,pengutronix.de,canonical.com,hartkopp.net,evilplan.or
 g];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon 02-03-26 15:24:18, Jeff Layton wrote:
> Convert isofs i_ino format strings to use the PRIino format
> macro in preparation for the widening of i_ino via kino_t.
> 
> Also correct signed format specifiers to unsigned, since inode
> numbers are unsigned values.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/isofs/compress.c | 2 +-
>  fs/isofs/dir.c      | 2 +-
>  fs/isofs/inode.c    | 6 +++---
>  fs/isofs/namei.c    | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/isofs/compress.c b/fs/isofs/compress.c
> index 50b4cb3aea87c7fc46b8b5483162bce84573b483..dc6c7d247cf880720be47cd26d23206d25a4e453 100644
> --- a/fs/isofs/compress.c
> +++ b/fs/isofs/compress.c
> @@ -156,7 +156,7 @@ static loff_t zisofs_uncompress_block(struct inode *inode, loff_t block_start,
>  				else {
>  					printk(KERN_DEBUG
>  					       "zisofs: zisofs_inflate returned"
> -					       " %d, inode = %lu,"
> +					       " %d, inode = %" PRIino "u,"
>  					       " page idx = %d, bh idx = %d,"
>  					       " avail_in = %ld,"
>  					       " avail_out = %ld\n",
> diff --git a/fs/isofs/dir.c b/fs/isofs/dir.c
> index 2ca16c3fe5ef3427e5bbd0631eb8323ef3c58bf1..0a8f9e411c23425a6919b7a4fa3fb387eb2c3209 100644
> --- a/fs/isofs/dir.c
> +++ b/fs/isofs/dir.c
> @@ -152,7 +152,7 @@ static int do_isofs_readdir(struct inode *inode, struct file *file,
>  		    de_len < de->name_len[0] +
>  					sizeof(struct iso_directory_record)) {
>  			printk(KERN_NOTICE "iso9660: Corrupted directory entry"
> -			       " in block %lu of inode %lu\n", block,
> +			       " in block %lu of inode %" PRIino "u\n", block,
>  			       inode->i_ino);
>  			brelse(bh);
>  			return -EIO;
> diff --git a/fs/isofs/inode.c b/fs/isofs/inode.c
> index 5c01536c5e8fecb73a95d801cdd3b8ee22011a3c..678d7363e157d893e005152e64e922d9170468d0 100644
> --- a/fs/isofs/inode.c
> +++ b/fs/isofs/inode.c
> @@ -1261,7 +1261,7 @@ static int isofs_read_level3_size(struct inode *inode)
>  
>  out_toomany:
>  	printk(KERN_INFO "%s: More than 100 file sections ?!?, aborting...\n"
> -		"isofs_read_level3_size: inode=%lu\n",
> +		"isofs_read_level3_size: inode=%" PRIino "u\n",
>  		__func__, inode->i_ino);
>  	goto out;
>  }
> @@ -1380,7 +1380,7 @@ static int isofs_read_inode(struct inode *inode, int relocated)
>  	/* I have no idea what file_unit_size is used for, so
>  	   we will flag it for now */
>  	if (de->file_unit_size[0] != 0) {
> -		printk(KERN_DEBUG "ISOFS: File unit size != 0 for ISO file (%ld).\n",
> +		printk(KERN_DEBUG "ISOFS: File unit size != 0 for ISO file (%" PRIino "u).\n",
>  			inode->i_ino);
>  	}
>  
> @@ -1450,7 +1450,7 @@ static int isofs_read_inode(struct inode *inode, int relocated)
>  		/* XXX - parse_rock_ridge_inode() had already set i_rdev. */
>  		init_special_inode(inode, inode->i_mode, inode->i_rdev);
>  	} else {
> -		printk(KERN_DEBUG "ISOFS: Invalid file type 0%04o for inode %lu.\n",
> +		printk(KERN_DEBUG "ISOFS: Invalid file type 0%04o for inode %" PRIino "u.\n",
>  			inode->i_mode, inode->i_ino);
>  		ret = -EIO;
>  		goto fail;
> diff --git a/fs/isofs/namei.c b/fs/isofs/namei.c
> index 58f80e1b3ac0d5082c24b5dbfd064cf5bff7d5a5..494d2ae4c0955123335a97f23672b959dcc9e0bd 100644
> --- a/fs/isofs/namei.c
> +++ b/fs/isofs/namei.c
> @@ -100,7 +100,7 @@ isofs_find_entry(struct inode *dir, struct dentry *dentry,
>  		/* Basic sanity check, whether name doesn't exceed dir entry */
>  		if (de_len < dlen + sizeof(struct iso_directory_record)) {
>  			printk(KERN_NOTICE "iso9660: Corrupted directory entry"
> -			       " in block %lu of inode %lu\n", block,
> +			       " in block %lu of inode %" PRIino "u\n", block,
>  			       dir->i_ino);
>  			brelse(bh);
>  			return 0;
> 
> -- 
> 2.53.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
