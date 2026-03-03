Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJhBOG/Hpmn3TQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Mar 2026 12:35:11 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D77401EDE6E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Mar 2026 12:35:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDALxz4H1H8YKNcDHhZjaHYKmjKip+i3qWg/JTkhSjU=; b=YeJu+16Yd7yqvDQjt7gZfjd2Ay
	/wE/hdJxqb3dY8sNksecdcNfLf+9livo8EhYEdX8X890nwbm7gkzmk3Cfo/5vgm766oIZWLrx1Dc9
	yQd9d6KdGIIPwIb30NfnJJQ7bDHrqBTv8/jiSZJgSv4l6yeFt5NQ7lNQqzTCpK+eoKL0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxO1r-0006aq-1k;
	Tue, 03 Mar 2026 11:35:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vxO1p-0006ak-BV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Mar 2026 11:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2KtMfk6gMVMjoQIrKorgsodqn+umYv4SqWiaDMLQLh8=; b=Q/DjY071snDfHvwoX4Fvj8EAEc
 ZLhH+V4Mb18bNkCdx5A3DytGtPb/UmRTdSTeMrlO3djxcNmOcgw18Yg9rtq58apF7alsCqUXZzoun
 tWGBA8CADyAsN/9spMAnq4/KYbF4Jb56BNMJPXfBmP42p7lSx5Sk73X3teeUJAEBRrBs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2KtMfk6gMVMjoQIrKorgsodqn+umYv4SqWiaDMLQLh8=; b=cA0gzSUZG4tbR1p52S2r/Z++ED
 00Ex1miQ/NXkZLrMObl0I7gm0Zz7ciIdZcmdlx6mM7oaeS/qfQM60ePmxxJz2iIdJmM0aOjN7IbMY
 AIVzCN/j/cyR08BK/gUntZ6/3DkmVHW9NaFDD8sRTC3xAgRx8rsqiLUwRM41vbepyPOA=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vxO1o-0004ZT-4y for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Mar 2026 11:35:05 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9E96F3F95B;
 Tue,  3 Mar 2026 11:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772537697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2KtMfk6gMVMjoQIrKorgsodqn+umYv4SqWiaDMLQLh8=;
 b=pXCz07BHHzIC4qyGYeJj1zJY4fSOqjkS5LFNOf+IuFQyaZBLkjOgOkxfS6ZmlBrJUpCShX
 lMXLCh0Kh3li8ULWw47rwNFTgaqUkIJukS3jO379SF23/8ffcNWRkrSs99m725psNbxSPN
 BtcFGp5iLwQ4JVVbv0LR1gs7zkmiq/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772537697;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2KtMfk6gMVMjoQIrKorgsodqn+umYv4SqWiaDMLQLh8=;
 b=5ZMPV/gGQeDku5UbctOORvDceLlFcJr3veNqwi8gjPw9myVqfisLA5re1u60WZv7uvDS6s
 CvipclKKh8Gp4bDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772537697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2KtMfk6gMVMjoQIrKorgsodqn+umYv4SqWiaDMLQLh8=;
 b=pXCz07BHHzIC4qyGYeJj1zJY4fSOqjkS5LFNOf+IuFQyaZBLkjOgOkxfS6ZmlBrJUpCShX
 lMXLCh0Kh3li8ULWw47rwNFTgaqUkIJukS3jO379SF23/8ffcNWRkrSs99m725psNbxSPN
 BtcFGp5iLwQ4JVVbv0LR1gs7zkmiq/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772537697;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2KtMfk6gMVMjoQIrKorgsodqn+umYv4SqWiaDMLQLh8=;
 b=5ZMPV/gGQeDku5UbctOORvDceLlFcJr3veNqwi8gjPw9myVqfisLA5re1u60WZv7uvDS6s
 CvipclKKh8Gp4bDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 885CC3EA6C;
 Tue,  3 Mar 2026 11:34:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id LuxAIWHHpmnaVQAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 03 Mar 2026 11:34:57 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 46C04A0A1B; Tue,  3 Mar 2026 12:34:53 +0100 (CET)
Date: Tue, 3 Mar 2026 12:34:53 +0100
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <jgnphntmcriuqdplzxlgsolfp6nioqdwpt2n32w26xdzovpwhq@uvu6a7frmfhb>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
 <20260302-iino-u64-v2-92-e5388800dae0@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260302-iino-u64-v2-92-e5388800dae0@kernel.org>
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
 Content preview:  On Mon 02-03-26 15:25:16, Jeff Layton wrote: > Now that i_ino
 is u64 and the PRIino format macro has been removed, > replace all uses in
 ocfs2 with the concrete format strings. > > Signed-off-by: Jeff [...] 
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
X-Headers-End: 1vxO1o-0004ZT-4y
Subject: Re: [f2fs-dev] [PATCH v2 092/110] ocfs2: replace PRIino with
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
X-Rspamd-Queue-Id: D77401EDE6E
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
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

On Mon 02-03-26 15:25:16, Jeff Layton wrote:
> Now that i_ino is u64 and the PRIino format macro has been removed,
> replace all uses in ocfs2 with the concrete format strings.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ocfs2/alloc.c        |  2 +-
>  fs/ocfs2/aops.c         |  4 ++--
>  fs/ocfs2/dir.c          |  8 ++++----
>  fs/ocfs2/dlmfs/dlmfs.c  | 10 +++++-----
>  fs/ocfs2/extent_map.c   | 12 ++++++------
>  fs/ocfs2/inode.c        |  2 +-
>  fs/ocfs2/refcounttree.c | 10 +++++-----
>  fs/ocfs2/xattr.c        |  4 ++--
>  8 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/fs/ocfs2/alloc.c b/fs/ocfs2/alloc.c
> index d7703549645b548d9f5d77b2214a9a7c0af0ef6f..d40f5d205bce3675ffd37e0e6c228e88c1804a1a 100644
> --- a/fs/ocfs2/alloc.c
> +++ b/fs/ocfs2/alloc.c
> @@ -7318,7 +7318,7 @@ int ocfs2_commit_truncate(struct ocfs2_super *osb,
>  		 * to check it up here before changing the tree.
>  		*/
>  		if (root_el->l_tree_depth && rec->e_int_clusters == 0) {
> -			mlog(ML_ERROR, "Inode %" PRIino "u has an empty "
> +			mlog(ML_ERROR, "Inode %llu has an empty "
>  				    "extent record, depth %u\n", inode->i_ino,
>  				    le16_to_cpu(root_el->l_tree_depth));
>  			status = ocfs2_remove_rightmost_empty_extent(osb,
> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
> index aea35b1c9fa3ce7327672c1862d0d1201c895c40..c7ad912ec7a0d6fffd09c3d38f110e5d1517d829 100644
> --- a/fs/ocfs2/aops.c
> +++ b/fs/ocfs2/aops.c
> @@ -137,7 +137,7 @@ int ocfs2_get_block(struct inode *inode, sector_t iblock,
>  			      (unsigned long long)iblock, bh_result, create);
>  
>  	if (OCFS2_I(inode)->ip_flags & OCFS2_INODE_SYSTEM_FILE)
> -		mlog(ML_NOTICE, "get_block on system inode 0x%p (%" PRIino "u)\n",
> +		mlog(ML_NOTICE, "get_block on system inode 0x%p (%llu)\n",
>  		     inode, inode->i_ino);
>  
>  	if (S_ISLNK(inode->i_mode)) {
> @@ -2146,7 +2146,7 @@ static int ocfs2_dio_wr_get_block(struct inode *inode, sector_t iblock,
>  	    ((iblock + ((len - 1) >> i_blkbits)) > endblk))
>  		len = (endblk - iblock + 1) << i_blkbits;
>  
> -	mlog(0, "get block of %" PRIino "u at %llu:%u req %u\n",
> +	mlog(0, "get block of %llu at %llu:%u req %u\n",
>  			inode->i_ino, pos, len, total_len);
>  
>  	/*
> diff --git a/fs/ocfs2/dir.c b/fs/ocfs2/dir.c
> index eecb2b1d2ec17fb4b3f09abb9e168d2f28f9b420..b82fe4431eb1f0811d81525237d02c5a3f3b021c 100644
> --- a/fs/ocfs2/dir.c
> +++ b/fs/ocfs2/dir.c
> @@ -794,7 +794,7 @@ static int ocfs2_dx_dir_lookup_rec(struct inode *inode,
>  	if (le16_to_cpu(el->l_count) !=
>  	    ocfs2_extent_recs_per_dx_root(inode->i_sb)) {
>  		ret = ocfs2_error(inode->i_sb,
> -				  "Inode %" PRIino "u has invalid extent list length %u\n",
> +				  "Inode %llu has invalid extent list length %u\n",
>  				  inode->i_ino, le16_to_cpu(el->l_count));
>  		goto out;
>  	}
> @@ -812,7 +812,7 @@ static int ocfs2_dx_dir_lookup_rec(struct inode *inode,
>  
>  		if (el->l_tree_depth) {
>  			ret = ocfs2_error(inode->i_sb,
> -					  "Inode %" PRIino "u has non zero tree depth in btree tree block %llu\n",
> +					  "Inode %llu has non zero tree depth in btree tree block %llu\n",
>  					  inode->i_ino,
>  					  (unsigned long long)eb_bh->b_blocknr);
>  			goto out;
> @@ -821,7 +821,7 @@ static int ocfs2_dx_dir_lookup_rec(struct inode *inode,
>  
>  	if (le16_to_cpu(el->l_next_free_rec) == 0) {
>  		ret = ocfs2_error(inode->i_sb,
> -				  "Inode %" PRIino "u has empty extent list at depth %u\n",
> +				  "Inode %llu has empty extent list at depth %u\n",
>  				  inode->i_ino,
>  				  le16_to_cpu(el->l_tree_depth));
>  		goto out;
> @@ -839,7 +839,7 @@ static int ocfs2_dx_dir_lookup_rec(struct inode *inode,
>  
>  	if (!found) {
>  		ret = ocfs2_error(inode->i_sb,
> -				  "Inode %" PRIino "u has bad extent record (%u, %u, 0) in btree\n",
> +				  "Inode %llu has bad extent record (%u, %u, 0) in btree\n",
>  				  inode->i_ino,
>  				  le32_to_cpu(rec->e_cpos),
>  				  ocfs2_rec_clusters(el, rec));
> diff --git a/fs/ocfs2/dlmfs/dlmfs.c b/fs/ocfs2/dlmfs/dlmfs.c
> index e96c1c574ff7dc3dffad58ce8536b7e337d3f6fa..5821e33df78fd92fabc7fe7fa1c3b3c62c50f9f8 100644
> --- a/fs/ocfs2/dlmfs/dlmfs.c
> +++ b/fs/ocfs2/dlmfs/dlmfs.c
> @@ -123,7 +123,7 @@ static int dlmfs_file_open(struct inode *inode,
>  	if (S_ISDIR(inode->i_mode))
>  		BUG();
>  
> -	mlog(0, "open called on inode %" PRIino "u, flags 0x%x\n", inode->i_ino,
> +	mlog(0, "open called on inode %llu, flags 0x%x\n", inode->i_ino,
>  		file->f_flags);
>  
>  	status = dlmfs_decode_open_flags(file->f_flags, &level, &flags);
> @@ -170,7 +170,7 @@ static int dlmfs_file_release(struct inode *inode,
>  	if (S_ISDIR(inode->i_mode))
>  		BUG();
>  
> -	mlog(0, "close called on inode %" PRIino "u\n", inode->i_ino);
> +	mlog(0, "close called on inode %llu\n", inode->i_ino);
>  
>  	if (fp) {
>  		level = fp->fp_lock_level;
> @@ -242,7 +242,7 @@ static ssize_t dlmfs_file_write(struct file *filp,
>  	int bytes_left;
>  	struct inode *inode = file_inode(filp);
>  
> -	mlog(0, "inode %" PRIino "u, count = %zu, *ppos = %llu\n",
> +	mlog(0, "inode %llu, count = %zu, *ppos = %llu\n",
>  		inode->i_ino, count, *ppos);
>  
>  	if (*ppos >= DLM_LVB_LEN)
> @@ -301,7 +301,7 @@ static void dlmfs_evict_inode(struct inode *inode)
>  
>  	clear_inode(inode);
>  
> -	mlog(0, "inode %" PRIino "u\n", inode->i_ino);
> +	mlog(0, "inode %llu\n", inode->i_ino);
>  
>  	ip = DLMFS_I(inode);
>  	lockres = &ip->ip_lockres;
> @@ -490,7 +490,7 @@ static int dlmfs_unlink(struct inode *dir,
>  	int status;
>  	struct inode *inode = d_inode(dentry);
>  
> -	mlog(0, "unlink inode %" PRIino "u\n", inode->i_ino);
> +	mlog(0, "unlink inode %llu\n", inode->i_ino);
>  
>  	/* if there are no current holders, or none that are waiting
>  	 * to acquire a lock, this basically destroys our lockres. */
> diff --git a/fs/ocfs2/extent_map.c b/fs/ocfs2/extent_map.c
> index 3cf93a08f7a8946810ccd2de246be4d07a23b53b..eb5dcd17d43752c08eab423fd667b7c0363ba6a1 100644
> --- a/fs/ocfs2/extent_map.c
> +++ b/fs/ocfs2/extent_map.c
> @@ -291,7 +291,7 @@ static int ocfs2_last_eb_is_empty(struct inode *inode,
>  
>  	if (el->l_tree_depth) {
>  		ocfs2_error(inode->i_sb,
> -			    "Inode %" PRIino "u has non zero tree depth in leaf block %llu\n",
> +			    "Inode %llu has non zero tree depth in leaf block %llu\n",
>  			    inode->i_ino,
>  			    (unsigned long long)eb_bh->b_blocknr);
>  		ret = -EROFS;
> @@ -427,7 +427,7 @@ static int ocfs2_get_clusters_nocache(struct inode *inode,
>  
>  		if (el->l_tree_depth) {
>  			ocfs2_error(inode->i_sb,
> -				    "Inode %" PRIino "u has non zero tree depth in leaf block %llu\n",
> +				    "Inode %llu has non zero tree depth in leaf block %llu\n",
>  				    inode->i_ino,
>  				    (unsigned long long)eb_bh->b_blocknr);
>  			ret = -EROFS;
> @@ -437,7 +437,7 @@ static int ocfs2_get_clusters_nocache(struct inode *inode,
>  
>  	if (le16_to_cpu(el->l_next_free_rec) > le16_to_cpu(el->l_count)) {
>  		ocfs2_error(inode->i_sb,
> -			    "Inode %" PRIino "u has an invalid extent (next_free_rec %u, count %u)\n",
> +			    "Inode %llu has an invalid extent (next_free_rec %u, count %u)\n",
>  			    inode->i_ino,
>  			    le16_to_cpu(el->l_next_free_rec),
>  			    le16_to_cpu(el->l_count));
> @@ -472,7 +472,7 @@ static int ocfs2_get_clusters_nocache(struct inode *inode,
>  
>  	if (!rec->e_blkno) {
>  		ocfs2_error(inode->i_sb,
> -			    "Inode %" PRIino "u has bad extent record (%u, %u, 0)\n",
> +			    "Inode %llu has bad extent record (%u, %u, 0)\n",
>  			    inode->i_ino,
>  			    le32_to_cpu(rec->e_cpos),
>  			    ocfs2_rec_clusters(el, rec));
> @@ -561,7 +561,7 @@ int ocfs2_xattr_get_clusters(struct inode *inode, u32 v_cluster,
>  
>  		if (el->l_tree_depth) {
>  			ocfs2_error(inode->i_sb,
> -				    "Inode %" PRIino "u has non zero tree depth in xattr leaf block %llu\n",
> +				    "Inode %llu has non zero tree depth in xattr leaf block %llu\n",
>  				    inode->i_ino,
>  				    (unsigned long long)eb_bh->b_blocknr);
>  			ret = -EROFS;
> @@ -580,7 +580,7 @@ int ocfs2_xattr_get_clusters(struct inode *inode, u32 v_cluster,
>  
>  		if (!rec->e_blkno) {
>  			ocfs2_error(inode->i_sb,
> -				    "Inode %" PRIino "u has bad extent record (%u, %u, 0) in xattr\n",
> +				    "Inode %llu has bad extent record (%u, %u, 0) in xattr\n",
>  				    inode->i_ino,
>  				    le32_to_cpu(rec->e_cpos),
>  				    ocfs2_rec_clusters(el, rec));
> diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
> index c3076b450de3599291c386ceeb8b2d26e8680904..26025ba2656c66b61866deaff60a0da204745c4f 100644
> --- a/fs/ocfs2/inode.c
> +++ b/fs/ocfs2/inode.c
> @@ -1196,7 +1196,7 @@ static void ocfs2_clear_inode(struct inode *inode)
>  				inode->i_nlink);
>  
>  	mlog_bug_on_msg(osb == NULL,
> -			"Inode=%" PRIino "u\n", inode->i_ino);
> +			"Inode=%llu\n", inode->i_ino);
>  
>  	dquot_drop(inode);
>  
> diff --git a/fs/ocfs2/refcounttree.c b/fs/ocfs2/refcounttree.c
> index 1586c42fdabe70056bf7f103d583dd9000fe9510..6d7f44d3e929d94f3ba6121cc30a867887e0bbe3 100644
> --- a/fs/ocfs2/refcounttree.c
> +++ b/fs/ocfs2/refcounttree.c
> @@ -2341,7 +2341,7 @@ static int ocfs2_mark_extent_refcounted(struct inode *inode,
>  					   cpos, len, phys);
>  
>  	if (!ocfs2_refcount_tree(OCFS2_SB(inode->i_sb))) {
> -		ret = ocfs2_error(inode->i_sb, "Inode %" PRIino "u want to use refcount tree, but the feature bit is not set in the super block\n",
> +		ret = ocfs2_error(inode->i_sb, "Inode %llu want to use refcount tree, but the feature bit is not set in the super block\n",
>  				  inode->i_ino);
>  		goto out;
>  	}
> @@ -2524,7 +2524,7 @@ int ocfs2_prepare_refcount_change_for_del(struct inode *inode,
>  	u64 start_cpos = ocfs2_blocks_to_clusters(inode->i_sb, phys_blkno);
>  
>  	if (!ocfs2_refcount_tree(OCFS2_SB(inode->i_sb))) {
> -		ret = ocfs2_error(inode->i_sb, "Inode %" PRIino "u want to use refcount tree, but the feature bit is not set in the super block\n",
> +		ret = ocfs2_error(inode->i_sb, "Inode %llu want to use refcount tree, but the feature bit is not set in the super block\n",
>  				  inode->i_ino);
>  		goto out;
>  	}
> @@ -2650,7 +2650,7 @@ static int ocfs2_refcount_cal_cow_clusters(struct inode *inode,
>  
>  		if (el->l_tree_depth) {
>  			ret = ocfs2_error(inode->i_sb,
> -					  "Inode %" PRIino "u has non zero tree depth in leaf block %llu\n",
> +					  "Inode %llu has non zero tree depth in leaf block %llu\n",
>  					  inode->i_ino,
>  					  (unsigned long long)eb_bh->b_blocknr);
>  			goto out;
> @@ -2662,7 +2662,7 @@ static int ocfs2_refcount_cal_cow_clusters(struct inode *inode,
>  		rec = &el->l_recs[i];
>  
>  		if (ocfs2_is_empty_extent(rec)) {
> -			mlog_bug_on_msg(i != 0, "Inode %" PRIino "u has empty record in "
> +			mlog_bug_on_msg(i != 0, "Inode %llu has empty record in "
>  					"index %d\n", inode->i_ino, i);
>  			continue;
>  		}
> @@ -3325,7 +3325,7 @@ static int ocfs2_replace_cow(struct ocfs2_cow_context *context)
>  	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
>  
>  	if (!ocfs2_refcount_tree(osb)) {
> -		return ocfs2_error(inode->i_sb, "Inode %" PRIino "u want to use refcount tree, but the feature bit is not set in the super block\n",
> +		return ocfs2_error(inode->i_sb, "Inode %llu want to use refcount tree, but the feature bit is not set in the super block\n",
>  				   inode->i_ino);
>  	}
>  
> diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
> index 74cd6dd57abf71a69adef18863d057e48496ccfe..4d55ad963ac514b4b4081447af0992345facd83a 100644
> --- a/fs/ocfs2/xattr.c
> +++ b/fs/ocfs2/xattr.c
> @@ -3741,7 +3741,7 @@ static int ocfs2_xattr_get_rec(struct inode *inode,
>  
>  		if (el->l_tree_depth) {
>  			ret = ocfs2_error(inode->i_sb,
> -					  "Inode %" PRIino "u has non zero tree depth in xattr tree block %llu\n",
> +					  "Inode %llu has non zero tree depth in xattr tree block %llu\n",
>  					  inode->i_ino,
>  					  (unsigned long long)eb_bh->b_blocknr);
>  			goto out;
> @@ -3758,7 +3758,7 @@ static int ocfs2_xattr_get_rec(struct inode *inode,
>  	}
>  
>  	if (!e_blkno) {
> -		ret = ocfs2_error(inode->i_sb, "Inode %" PRIino "u has bad extent record (%u, %u, 0) in xattr\n",
> +		ret = ocfs2_error(inode->i_sb, "Inode %llu has bad extent record (%u, %u, 0) in xattr\n",
>  				  inode->i_ino,
>  				  le32_to_cpu(rec->e_cpos),
>  				  ocfs2_rec_clusters(el, rec));
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
