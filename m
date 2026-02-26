Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Du2E1V8oGlgkQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 18:01:09 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 606EE1AB8AA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 18:01:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83EcRiksli//ovjbxep2DgWLQ8DfBwQ1IMnLX9VX5Gg=; b=d57PMvQmMvCswCYhDNO9uyJHnd
	bKs3xyOD3ve4EoZZYu1Lq3YeZ843keG4JuwxQXKkGs6QIQol6QuTVXbG7oMjhMpX7V8HZTyPD70bE
	M4Cv4RRrW0+o0Fpec2LA24HNrERXolJUlpYIf4IGZpL4WGD9WyNKGE+t+rZOwAJrugGQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvejL-000238-Am;
	Thu, 26 Feb 2026 17:00:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vvejJ-00022t-O5
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 17:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2UqxE3+lcinVC8tUtPMhxZS4tV0HDyUFUfF7VsRmpXg=; b=hVbMgBtCSUcO0fgDBp6yyIBtWJ
 /XhV9+z9E5ezrqCBHRIrA3DoRVCaWoi1BBxL/4GOiU0n173OiLXuQBLO8tanJAMsZ/pWpveEEdzoR
 yLM7i0SkJSKl7OU/ggW2/BqriyZeBQGmCv7JZKYf4W2w7dL6GP5iCvsxWsl3t+dilYZM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2UqxE3+lcinVC8tUtPMhxZS4tV0HDyUFUfF7VsRmpXg=; b=Gf7MM3KxM9Itl4ZsYiVHorcO6S
 Ye3yx7t58EUUPpJPOQlTcO4LKetgWZeWn9HTrizIBkA3Bg5AifdHXVJEE/wP3ZjdqrjKlPhH/RX+c
 Qi/zlVr0tDg82YaI9awnDneBB/s7eNkfndT5+e8dTIhybzqbBvvx5FvExWAZm8Zo9uCA=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vvejJ-0001NP-BC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 17:00:50 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BD9CC1FB1A;
 Thu, 26 Feb 2026 17:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772125243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2UqxE3+lcinVC8tUtPMhxZS4tV0HDyUFUfF7VsRmpXg=;
 b=XJGRYCvUQEtIavuwyI0SAwKPiy3GZ/OGVFA/HK00Zt+6pITIKUpnRL9qJli9zFinAkD1W7
 Vxgy8eY26i46GzNiwxgtrpkXkYptZJCqiB05xpDR2FfG7+w4FXN6zZ2zwKUXqTSCs2t/PT
 iRkQO9+ZXTTMOyySveoDk4AAkQYE2SE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772125243;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2UqxE3+lcinVC8tUtPMhxZS4tV0HDyUFUfF7VsRmpXg=;
 b=HFKLpE5PEy48uwFKGnDhcBt+zN1U7QXn1+eST5YuNecl5/9geGKgIwMhoURm5MEd+cRRnD
 Ek1LpwK7K+IiblBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772125240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2UqxE3+lcinVC8tUtPMhxZS4tV0HDyUFUfF7VsRmpXg=;
 b=P0cj5v4E6hRE7j8RzUgxGJPn1i5piS2UxiIx1ItwZ56RFolWcP2L5iYRpfabk3xpxJajdy
 2cskCjRdF1qAxrAvUUWm9uDlwOb5uzOicFHIkGNUOGU2xvBSrsDYnKZwwsWhpkbVWNZGW4
 nC9jI1iVB3z8PRq+9A6F/BRSx4k26yM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772125240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2UqxE3+lcinVC8tUtPMhxZS4tV0HDyUFUfF7VsRmpXg=;
 b=qDd8WHtqgMZ3g7j76If0cqNMPcnUnXUjZYYYy50JHWmm2+96xHsEXdjzAcqO2Nfud1EwU2
 UYQIvBB456QifSAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A90923EA62;
 Thu, 26 Feb 2026 17:00:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Cg06KTh8oGmpPAAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 26 Feb 2026 17:00:40 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 545EAA0A27; Thu, 26 Feb 2026 18:00:36 +0100 (CET)
Date: Thu, 26 Feb 2026 18:00:36 +0100
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <cmxf6pu3xuwvbhg3alu725hd4b3dheowoumd6drolde7pypwor@eplss6764uuf>
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
 <20260226-iino-u64-v1-1-ccceff366db9@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260226-iino-u64-v1-1-ccceff366db9@kernel.org>
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
 Content preview:  On Thu 26-02-26 10:55:03, Jeff Layton wrote: > Change the
 inode hash/lookup VFS API functions to accept u64 parameters > instead of
 unsigned long for inode numbers and hash values. This is > preparati [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1vvejJ-0001NP-BC
Subject: Re: [f2fs-dev] [PATCH 01/61] vfs: widen inode hash/lookup functions
 to u64
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
 linux-hams@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 Fan Wu <wufan@kernel.org>, ceph-devel@vger.kernel.org,
 James Morris <jmorris@namei.org>, Tyler Hicks <code@tyhicks.com>,
 Christoph Hellwig <hch@infradead.org>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Martin Schiller <ms@dev.tdt.de>,
 Jan Harkes <jaharkes@cs.cmu.edu>, Willem de Bruijn <willemb@google.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-fscrypt@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Hildenbrand <david@kernel.org>, Eric Van Hensbergen <ericvh@kernel.org>,
 Christian Brauner <brauner@kernel.org>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Jan Kara <jack@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 linux-media@vger.kernel.org, Trond Myklebust <trondmy@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Dave Kleikamp <shaggy@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Oleg Nesterov <oleg@redhat.com>,
 Eric Dumazet <edumazet@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-cifs@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>,
 linux-nilfs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 codalist@coda.cs.cmu.edu, linux-trace-kernel@vger.kernel.org,
 Olga Kornievskaia <okorniev@redhat.com>, Yangtao Li <frank.li@vivo.com>,
 selinux@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Casey Schaufler <casey@schaufler-ca.com>, netfs@lists.linux.dev,
 Jaegeuk Kim <jaegeuk@kernel.org>, fsverity@lists.linux.dev,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Nicolas Pitre <nico@fluxnic.net>,
 Muchun Song <muchun.song@linux.dev>, Roberto Sassu <roberto.sassu@huawei.com>,
 "David S. Miller" <davem@davemloft.net>, Anna Schumaker <anna@kernel.org>,
 linux-integrity@vger.kernel.org, Alex Markuze <amarkuze@redhat.com>,
 Martin Brandenburg <martin@omnibond.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 ocfs2-devel@lists.linux.dev, jfs-discussion@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
 Ian Kent <raven@themaw.net>, Naohiro Aota <naohiro.aota@wdc.com>,
 Eric Biggers <ebiggers@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Matthew Wilcox <willy@infradead.org>, coda@cs.cmu.edu,
 Viacheslav Dubeyko <slava@dubeyko.com>, NeilBrown <neil@brown.name>,
 Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Amir Goldstein <amir73il@gmail.com>,
 James Clark <james.clark@linaro.org>, autofs@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Damien Le Moal <dlemoal@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 samba-technical@lists.samba.org, Ondrej Mosnacek <omosnace@redhat.com>,
 Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev,
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
 Eric Snowberg <eric.snowberg@oracle.com>, linux-x25@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Salah Triki <salah.triki@gmail.com>,
 Simon Horman <horms@kernel.org>, apparmor@lists.ubuntu.com,
 Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Namhyung Kim <namhyung@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 John Johansen <john.johansen@canonical.com>,
 Luis de Bethencourt <luisbg@kernel.org>, netdev@vger.kernel.org,
 v9fs@lists.linux.dev, Adrian Hunter <adrian.hunter@intel.com>,
 linux-security-module@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jlayton@kernel.org,m:lucho@ionkov.net,m:nvdimm@lists.linux.dev,m:pc@manguebit.org,m:djwong@kernel.org,m:al@alarsen.net,m:dri-devel@lists.freedesktop.org,m:linux-hams@vger.kernel.org,m:sumit.semwal@linaro.org,m:hubcap@omnibond.com,m:linux-xfs@vger.kernel.org,m:wufan@kernel.org,m:ceph-devel@vger.kernel.org,m:jmorris@namei.org,m:code@tyhicks.com,m:hch@infradead.org,m:devel@lists.orangefs.org,m:sprasad@microsoft.com,m:ms@dev.tdt.de,m:jaharkes@cs.cmu.edu,m:willemb@google.com,m:acme@kernel.org,m:linux-fscrypt@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:david@kernel.org,m:ericvh@kernel.org,m:brauner@kernel.org,m:dmitry.kasatkin@gmail.com,m:stephen.smalley.work@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:chuck.lever@oracle.com,m:mhiramat@kernel.org,m:jolsa@kernel.org,m:jack@suse.com,m:alexander.deucher@amd.com,m:linux-media@vger.kernel.org,m:trondmy@kernel.org,m:mark.rutland
 @arm.com,m:shaggy@kernel.org,m:zohar@linux.ibm.com,m:oleg@redhat.com,m:edumazet@google.com,m:simona@ffwll.ch,m:linux-cifs@vger.kernel.org,m:kuniyu@google.com,m:linux-nilfs@vger.kernel.org,m:paul@paul-moore.com,m:codalist@coda.cs.cmu.edu,m:linux-trace-kernel@vger.kernel.org,m:okorniev@redhat.com,m:frank.li@vivo.com,m:selinux@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:casey@schaufler-ca.com,m:netfs@lists.linux.dev,m:jaegeuk@kernel.org,m:fsverity@lists.linux.dev,m:tytso@mit.edu,m:nico@fluxnic.net,m:muchun.song@linux.dev,m:roberto.sassu@huawei.com,m:davem@davemloft.net,m:anna@kernel.org,m:linux-integrity@vger.kernel.org,m:amarkuze@redhat.com,m:martin@omnibond.com,m:alexander.shishkin@linux.intel.com,m:ocfs2-devel@lists.linux.dev,m:jfs-discussion@lists.sourceforge.net,m:linux-mtd@lists.infradead.org,m:amd-gfx@lists.freedesktop.org,m:marc.dionne@auristor.com,m:linux-afs@lists.infradead.org,m:raven@themaw.net,m:naohiro.aota@wdc.com,m:ebiggers@kernel.org,m:miklos@szeredi.hu,m:willy@
 infradead.org,m:coda@cs.cmu.edu,m:slava@dubeyko.com,m:neil@brown.name,m:idryomov@gmail.com,m:pabeni@redhat.com,m:serge@hallyn.com,m:amir73il@gmail.com,m:james.clark@linaro.org,m:autofs@vger.kernel.org,m:rostedt@goodmis.org,m:dlemoal@kernel.org,m:mathieu.desnoyers@efficios.com,m:dan.j.williams@intel.com,m:osalvador@suse.de,m:almaz.alexandrovich@paragon-software.com,m:linux-nfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[ionkov.net,lists.linux.dev,manguebit.org,kernel.org,alarsen.net,lists.freedesktop.org,vger.kernel.org,linaro.org,omnibond.com,namei.org,tyhicks.com,infradead.org,lists.orangefs.org,microsoft.com,dev.tdt.de,cs.cmu.edu,google.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,oracle.com,suse.com,amd.com,arm.com,linux.ibm.com,redhat.com,ffwll.ch,paul-moore.com,coda.cs.cmu.edu,vivo.com,lists.linaro.org,schaufler-ca.com,mit.edu,fluxnic.net,linux.dev,huawei.com,davemloft.net,linux.intel.com,lists.sourceforge.net,lists.infradead.org,auristor.com,themaw.net,wdc.com,szeredi.hu,dubeyko.com,brown.name,hallyn.com,goodmis.org,efficios.com,intel.com,suse.de,paragon-software.com,kvack.org,lists.samba.org,samba.org,suse.cz,codewreck.org,crudebyte.com,linux.alibaba.com,dilger.ca,artax.karlin.mff.cuni.cz,nod.at,fasheh.com,lists.ubuntu.com,talpey.com,canonical.com,evilplan.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,suse.cz:email];
	RCPT_COUNT_GT_50(0.00)[144];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.cz:-];
	NEURAL_HAM(-0.00)[-0.970];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RSPAMD_EMAILBL_FAIL(0.00)[jack.suse.cz:query timed out,jack.suse.com:query timed out];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 606EE1AB8AA
X-Rspamd-Action: no action

On Thu 26-02-26 10:55:03, Jeff Layton wrote:
> Change the inode hash/lookup VFS API functions to accept u64 parameters
> instead of unsigned long for inode numbers and hash values. This is
> preparation for widening i_ino itself to u64, which will allow
> filesystems to store full 64-bit inode numbers on 32-bit architectures.
> 
> Since unsigned long implicitly widens to u64 on all architectures, this
> change is backward-compatible with all existing callers.
> 
> Functions updated:
>   - hash(), find_inode_fast(), find_inode_by_ino_rcu(), test_inode_iunique()
>   - __insert_inode_hash(), iget_locked(), iget5_locked(), iget5_locked_rcu()
>   - ilookup(), ilookup5(), ilookup5_nowait()
>   - find_inode_nowait(), find_inode_rcu()
>   - inode_insert5(), insert_inode_locked4()
>   - insert_inode_locked() (local variable)
>   - dump_mapping() (local variable and format string)
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/inode.c         | 46 +++++++++++++++++++++++-----------------------
>  include/linux/fs.h | 26 +++++++++++++-------------
>  2 files changed, 36 insertions(+), 36 deletions(-)
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index cc12b68e021b2c97cc88a46ddc736334ecb8edfa..2cabec9043e8176d20aecc5ce7e0f276c114f122 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -672,7 +672,7 @@ static inline void inode_sb_list_del(struct inode *inode)
>  	}
>  }
>  
> -static unsigned long hash(struct super_block *sb, unsigned long hashval)
> +static unsigned long hash(struct super_block *sb, u64 hashval)
>  {
>  	unsigned long tmp;
>  
> @@ -685,12 +685,12 @@ static unsigned long hash(struct super_block *sb, unsigned long hashval)
>  /**
>   *	__insert_inode_hash - hash an inode
>   *	@inode: unhashed inode
> - *	@hashval: unsigned long value used to locate this object in the
> + *	@hashval: u64 value used to locate this object in the
>   *		inode_hashtable.
>   *
>   *	Add an inode to the inode hash for this superblock.
>   */
> -void __insert_inode_hash(struct inode *inode, unsigned long hashval)
> +void __insert_inode_hash(struct inode *inode, u64 hashval)
>  {
>  	struct hlist_head *b = inode_hashtable + hash(inode->i_sb, hashval);
>  
> @@ -726,7 +726,7 @@ void dump_mapping(const struct address_space *mapping)
>  	struct dentry *dentry_ptr;
>  	struct dentry dentry;
>  	char fname[64] = {};
> -	unsigned long ino;
> +	u64 ino;
>  
>  	/*
>  	 * If mapping is an invalid pointer, we don't want to crash
> @@ -750,14 +750,14 @@ void dump_mapping(const struct address_space *mapping)
>  	}
>  
>  	if (!dentry_first) {
> -		pr_warn("aops:%ps ino:%lx\n", a_ops, ino);
> +		pr_warn("aops:%ps ino:%llx\n", a_ops, ino);
>  		return;
>  	}
>  
>  	dentry_ptr = container_of(dentry_first, struct dentry, d_u.d_alias);
>  	if (get_kernel_nofault(dentry, dentry_ptr) ||
>  	    !dentry.d_parent || !dentry.d_name.name) {
> -		pr_warn("aops:%ps ino:%lx invalid dentry:%px\n",
> +		pr_warn("aops:%ps ino:%llx invalid dentry:%px\n",
>  				a_ops, ino, dentry_ptr);
>  		return;
>  	}
> @@ -768,7 +768,7 @@ void dump_mapping(const struct address_space *mapping)
>  	 * Even if strncpy_from_kernel_nofault() succeeded,
>  	 * the fname could be unreliable
>  	 */
> -	pr_warn("aops:%ps ino:%lx dentry name(?):\"%s\"\n",
> +	pr_warn("aops:%ps ino:%llx dentry name(?):\"%s\"\n",
>  		a_ops, ino, fname);
>  }
>  
> @@ -1087,7 +1087,7 @@ static struct inode *find_inode(struct super_block *sb,
>   * iget_locked for details.
>   */
>  static struct inode *find_inode_fast(struct super_block *sb,
> -				struct hlist_head *head, unsigned long ino,
> +				struct hlist_head *head, u64 ino,
>  				bool hash_locked, bool *isnew)
>  {
>  	struct inode *inode = NULL;
> @@ -1301,7 +1301,7 @@ EXPORT_SYMBOL(unlock_two_nondirectories);
>   * Note that both @test and @set are called with the inode_hash_lock held, so
>   * they can't sleep.
>   */
> -struct inode *inode_insert5(struct inode *inode, unsigned long hashval,
> +struct inode *inode_insert5(struct inode *inode, u64 hashval,
>  			    int (*test)(struct inode *, void *),
>  			    int (*set)(struct inode *, void *), void *data)
>  {
> @@ -1378,7 +1378,7 @@ EXPORT_SYMBOL(inode_insert5);
>   * Note that both @test and @set are called with the inode_hash_lock held, so
>   * they can't sleep.
>   */
> -struct inode *iget5_locked(struct super_block *sb, unsigned long hashval,
> +struct inode *iget5_locked(struct super_block *sb, u64 hashval,
>  		int (*test)(struct inode *, void *),
>  		int (*set)(struct inode *, void *), void *data)
>  {
> @@ -1408,7 +1408,7 @@ EXPORT_SYMBOL(iget5_locked);
>   * This is equivalent to iget5_locked, except the @test callback must
>   * tolerate the inode not being stable, including being mid-teardown.
>   */
> -struct inode *iget5_locked_rcu(struct super_block *sb, unsigned long hashval,
> +struct inode *iget5_locked_rcu(struct super_block *sb, u64 hashval,
>  		int (*test)(struct inode *, void *),
>  		int (*set)(struct inode *, void *), void *data)
>  {
> @@ -1455,7 +1455,7 @@ EXPORT_SYMBOL_GPL(iget5_locked_rcu);
>   * hashed, and with the I_NEW flag set.  The file system gets to fill it in
>   * before unlocking it via unlock_new_inode().
>   */
> -struct inode *iget_locked(struct super_block *sb, unsigned long ino)
> +struct inode *iget_locked(struct super_block *sb, u64 ino)
>  {
>  	struct hlist_head *head = inode_hashtable + hash(sb, ino);
>  	struct inode *inode;
> @@ -1527,7 +1527,7 @@ EXPORT_SYMBOL(iget_locked);
>   *
>   * Returns 1 if the inode number is unique, 0 if it is not.
>   */
> -static int test_inode_iunique(struct super_block *sb, unsigned long ino)
> +static int test_inode_iunique(struct super_block *sb, u64 ino)
>  {
>  	struct hlist_head *b = inode_hashtable + hash(sb, ino);
>  	struct inode *inode;
> @@ -1616,7 +1616,7 @@ EXPORT_SYMBOL(igrab);
>   *
>   * Note2: @test is called with the inode_hash_lock held, so can't sleep.
>   */
> -struct inode *ilookup5_nowait(struct super_block *sb, unsigned long hashval,
> +struct inode *ilookup5_nowait(struct super_block *sb, u64 hashval,
>  		int (*test)(struct inode *, void *), void *data, bool *isnew)
>  {
>  	struct hlist_head *head = inode_hashtable + hash(sb, hashval);
> @@ -1647,7 +1647,7 @@ EXPORT_SYMBOL(ilookup5_nowait);
>   *
>   * Note: @test is called with the inode_hash_lock held, so can't sleep.
>   */
> -struct inode *ilookup5(struct super_block *sb, unsigned long hashval,
> +struct inode *ilookup5(struct super_block *sb, u64 hashval,
>  		int (*test)(struct inode *, void *), void *data)
>  {
>  	struct inode *inode;
> @@ -1677,7 +1677,7 @@ EXPORT_SYMBOL(ilookup5);
>   * Search for the inode @ino in the inode cache, and if the inode is in the
>   * cache, the inode is returned with an incremented reference count.
>   */
> -struct inode *ilookup(struct super_block *sb, unsigned long ino)
> +struct inode *ilookup(struct super_block *sb, u64 ino)
>  {
>  	struct hlist_head *head = inode_hashtable + hash(sb, ino);
>  	struct inode *inode;
> @@ -1726,8 +1726,8 @@ EXPORT_SYMBOL(ilookup);
>   * very carefully implemented.
>   */
>  struct inode *find_inode_nowait(struct super_block *sb,
> -				unsigned long hashval,
> -				int (*match)(struct inode *, unsigned long,
> +				u64 hashval,
> +				int (*match)(struct inode *, u64,
>  					     void *),
>  				void *data)
>  {
> @@ -1773,7 +1773,7 @@ EXPORT_SYMBOL(find_inode_nowait);
>   *
>   * The caller must hold the RCU read lock.
>   */
> -struct inode *find_inode_rcu(struct super_block *sb, unsigned long hashval,
> +struct inode *find_inode_rcu(struct super_block *sb, u64 hashval,
>  			     int (*test)(struct inode *, void *), void *data)
>  {
>  	struct hlist_head *head = inode_hashtable + hash(sb, hashval);
> @@ -1812,7 +1812,7 @@ EXPORT_SYMBOL(find_inode_rcu);
>   * The caller must hold the RCU read lock.
>   */
>  struct inode *find_inode_by_ino_rcu(struct super_block *sb,
> -				    unsigned long ino)
> +				    u64 ino)
>  {
>  	struct hlist_head *head = inode_hashtable + hash(sb, ino);
>  	struct inode *inode;
> @@ -1833,7 +1833,7 @@ EXPORT_SYMBOL(find_inode_by_ino_rcu);
>  int insert_inode_locked(struct inode *inode)
>  {
>  	struct super_block *sb = inode->i_sb;
> -	ino_t ino = inode->i_ino;
> +	u64 ino = inode->i_ino;
>  	struct hlist_head *head = inode_hashtable + hash(sb, ino);
>  	bool isnew;
>  
> @@ -1884,7 +1884,7 @@ int insert_inode_locked(struct inode *inode)
>  }
>  EXPORT_SYMBOL(insert_inode_locked);
>  
> -int insert_inode_locked4(struct inode *inode, unsigned long hashval,
> +int insert_inode_locked4(struct inode *inode, u64 hashval,
>  		int (*test)(struct inode *, void *), void *data)
>  {
>  	struct inode *old;
> @@ -2642,7 +2642,7 @@ void init_special_inode(struct inode *inode, umode_t mode, dev_t rdev)
>  		break;
>  	default:
>  		printk(KERN_DEBUG "init_special_inode: bogus i_mode (%o) for"
> -				  " inode %s:%lu\n", mode, inode->i_sb->s_id,
> +				  " inode %s:%llu\n", mode, inode->i_sb->s_id,
>  				  inode->i_ino);
>  		break;
>  	}
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 8b3dd145b25ec12b00ac1df17a952d9116b88047..dfa1f475b1c480c503ab6f00e891aa9b051607fa 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2935,32 +2935,32 @@ static inline int inode_generic_drop(struct inode *inode)
>  extern void d_mark_dontcache(struct inode *inode);
>  
>  extern struct inode *ilookup5_nowait(struct super_block *sb,
> -		unsigned long hashval, int (*test)(struct inode *, void *),
> +		u64 hashval, int (*test)(struct inode *, void *),
>  		void *data, bool *isnew);
> -extern struct inode *ilookup5(struct super_block *sb, unsigned long hashval,
> +extern struct inode *ilookup5(struct super_block *sb, u64 hashval,
>  		int (*test)(struct inode *, void *), void *data);
> -extern struct inode *ilookup(struct super_block *sb, unsigned long ino);
> +extern struct inode *ilookup(struct super_block *sb, u64 ino);
>  
> -extern struct inode *inode_insert5(struct inode *inode, unsigned long hashval,
> +extern struct inode *inode_insert5(struct inode *inode, u64 hashval,
>  		int (*test)(struct inode *, void *),
>  		int (*set)(struct inode *, void *),
>  		void *data);
> -struct inode *iget5_locked(struct super_block *, unsigned long,
> +struct inode *iget5_locked(struct super_block *, u64,
>  			   int (*test)(struct inode *, void *),
>  			   int (*set)(struct inode *, void *), void *);
> -struct inode *iget5_locked_rcu(struct super_block *, unsigned long,
> +struct inode *iget5_locked_rcu(struct super_block *, u64,
>  			       int (*test)(struct inode *, void *),
>  			       int (*set)(struct inode *, void *), void *);
> -extern struct inode * iget_locked(struct super_block *, unsigned long);
> +extern struct inode *iget_locked(struct super_block *, u64);
>  extern struct inode *find_inode_nowait(struct super_block *,
> -				       unsigned long,
> +				       u64,
>  				       int (*match)(struct inode *,
> -						    unsigned long, void *),
> +						    u64, void *),
>  				       void *data);
> -extern struct inode *find_inode_rcu(struct super_block *, unsigned long,
> +extern struct inode *find_inode_rcu(struct super_block *, u64,
>  				    int (*)(struct inode *, void *), void *);
> -extern struct inode *find_inode_by_ino_rcu(struct super_block *, unsigned long);
> -extern int insert_inode_locked4(struct inode *, unsigned long, int (*test)(struct inode *, void *), void *);
> +extern struct inode *find_inode_by_ino_rcu(struct super_block *, u64);
> +extern int insert_inode_locked4(struct inode *, u64, int (*test)(struct inode *, void *), void *);
>  extern int insert_inode_locked(struct inode *);
>  #ifdef CONFIG_DEBUG_LOCK_ALLOC
>  extern void lockdep_annotate_inode_mutex_key(struct inode *inode);
> @@ -3015,7 +3015,7 @@ int setattr_should_drop_sgid(struct mnt_idmap *idmap,
>   */
>  #define alloc_inode_sb(_sb, _cache, _gfp) kmem_cache_alloc_lru(_cache, &_sb->s_inode_lru, _gfp)
>  
> -extern void __insert_inode_hash(struct inode *, unsigned long hashval);
> +extern void __insert_inode_hash(struct inode *, u64 hashval);
>  static inline void insert_inode_hash(struct inode *inode)
>  {
>  	__insert_inode_hash(inode, inode->i_ino);
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
