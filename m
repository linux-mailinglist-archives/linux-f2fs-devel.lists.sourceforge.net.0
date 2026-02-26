Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8G45HFFzoGlZjwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:22:41 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0461AA20C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:22:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPcn8kEXiGBgHmyLRC5CyphBiz+VHsgcATNY3grMl3k=; b=nO02vFxlPayzft78BVRDqt7bWD
	a/EU3q355Nroz8EPVCAm/66THwHy22V6dKxFhBkvUd7vc+gFKVIpWWOOLoqsdT28BFM9pYU6ORdQ+
	qZCrrWgWPWU33VCJKRYJUOemn6B3UU4896rwTb2YwY8EEXlF+Q2FrusHi+KbciFJvbII=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vve8F-0003cw-Mb;
	Thu, 26 Feb 2026 16:22:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vve8D-0003cd-VN;
 Thu, 26 Feb 2026 16:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FEJyjbicGOzFjiYzXKTkera7jYDMXPs4gjGho33QAb4=; b=T54QOwDBlPC7TOgH/Oa27jDc0H
 Z6ZBUeGUyUcYmCYtyyWBDfvh1eSAK1br8Rr92hBYW2u6xHIKcTtebTvV0zzbBl+R8SPiesjNaJ6kF
 m8acQ9Rz6bOx/BE6qoNhf04Gd0KEgJyRUxElClffw9wL67lNIaGNw9fybpPI7j3NubC0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FEJyjbicGOzFjiYzXKTkera7jYDMXPs4gjGho33QAb4=; b=IDjLOTXNrrqNzE2n5g4ACM1GSw
 MI5eN3DY1VrhGmiSrT3LtUifGKLELDodmN3QT+2UT/pUNBiT8DO2cmqP62y+r1G8pMS26z2NMpo6B
 +k1LdrgbP+yFd+IZXbylvO1SIfMlr289kOz36HYiq2UENoW+O+8X5f1Qmi0I3YKQCDUk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vve8D-0007X5-Dq; Thu, 26 Feb 2026 16:22:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A6E5A6013A;
 Thu, 26 Feb 2026 16:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FBF5C116C6;
 Thu, 26 Feb 2026 16:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772122943;
 bh=zBSOHROIWzwnJvs9/9cwNsUSUVDRgXIG4XZCDyNzlZs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JssZjrPw1BO0Mw8Q9yfwnQsgaD6FpgkNgIWpbVUWXLyeJnokKKg4hk1SAaRN/4Pl2
 p5YBVNEqJjiqtkjLnya4b8Ga67KiibEKKFpBd87HHM6a9Nr/QZeAv6psBrGRdFMMiz
 A9DSSr/iUARrTgSnBid48sZtR6nbfqnBEMtEEnmZIzWpuH9bLY6kY9ErKk7lBImyBm
 /Lk4+mloyiRijQ2SiVpy8mPc9oycbHcUIEINyu+Tm3ChF79dz7yAux92+Q0KlVrv/G
 LUTkHVEDI976MFOVD4JvxorvgEXP2iFNe7YZQj9uo/QF6AdIL6XZAAV6xKOXhQSqTF
 qLmaMxW89/z7g==
Date: Thu, 26 Feb 2026 08:22:22 -0800
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20260226162222.GH13829@frogsfrogsfrogs>
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
 <20260226-iino-u64-v1-61-ccceff366db9@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260226-iino-u64-v1-61-ccceff366db9@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Feb 26, 2026 at 10:56:03AM -0500, Jeff Layton wrote:
 > Update format strings from %lu/%lx to %llu/%llx and 0UL literal to > 0ULL
 in pipe, dcache, fserror, and eventpoll, now that i_ino is u64 [...] 
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vve8D-0007X5-Dq
Subject: Re: [f2fs-dev] [PATCH 61/61] vfs: update core format strings for
 u64 i_ino
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>, Anders Larsen <al@alarsen.net>,
 dri-devel@lists.freedesktop.org, linux-hams@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Fan Wu <wufan@kernel.org>,
 ceph-devel@vger.kernel.org, James Morris <jmorris@namei.org>,
 Tyler Hicks <code@tyhicks.com>, Christoph Hellwig <hch@infradead.org>,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Martin Schiller <ms@dev.tdt.de>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Willem de Bruijn <willemb@google.com>,
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
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
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
X-Spamd-Result: default: False [-6.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ionkov.net,lists.linux.dev,manguebit.org,alarsen.net,lists.freedesktop.org,vger.kernel.org,linaro.org,omnibond.com,kernel.org,namei.org,tyhicks.com,infradead.org,lists.orangefs.org,microsoft.com,dev.tdt.de,cs.cmu.edu,google.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,oracle.com,suse.com,amd.com,arm.com,linux.ibm.com,redhat.com,ffwll.ch,paul-moore.com,coda.cs.cmu.edu,vivo.com,lists.linaro.org,schaufler-ca.com,mit.edu,fluxnic.net,linux.dev,huawei.com,davemloft.net,linux.intel.com,lists.sourceforge.net,lists.infradead.org,auristor.com,themaw.net,wdc.com,szeredi.hu,dubeyko.com,brown.name,hallyn.com,goodmis.org,efficios.com,intel.com,suse.de,paragon-software.com,kvack.org,lists.samba.org,samba.org,suse.cz,codewreck.org,crudebyte.com,linux.alibaba.com,dilger.ca,artax.karlin.mff.cuni.cz,nod.at,fasheh.com,lists.ubuntu.com,talpey.com,canonical.com,evilplan.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCPT_COUNT_GT_50(0.00)[143];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: DD0461AA20C
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 10:56:03AM -0500, Jeff Layton wrote:
> Update format strings from %lu/%lx to %llu/%llx and 0UL literal to
> 0ULL in pipe, dcache, fserror, and eventpoll, now that i_ino is u64
> instead of unsigned long.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Acked-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  fs/dcache.c    | 4 ++--
>  fs/eventpoll.c | 2 +-
>  fs/fserror.c   | 2 +-
>  fs/pipe.c      | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/dcache.c b/fs/dcache.c
> index 24f4f3acaa8cffd6f98124eec38c1a92d6c9fd8e..9e8425ecd88955c72027d21591b1d12c87e7e8aa 100644
> --- a/fs/dcache.c
> +++ b/fs/dcache.c
> @@ -1637,11 +1637,11 @@ static enum d_walk_ret umount_check(void *_data, struct dentry *dentry)
>  	if (dentry == _data && dentry->d_lockref.count == 1)
>  		return D_WALK_CONTINUE;
>  
> -	WARN(1, "BUG: Dentry %p{i=%lx,n=%pd} "
> +	WARN(1, "BUG: Dentry %p{i=%llx,n=%pd} "
>  			" still in use (%d) [unmount of %s %s]\n",
>  		       dentry,
>  		       dentry->d_inode ?
> -		       dentry->d_inode->i_ino : 0UL,
> +		       dentry->d_inode->i_ino : 0ULL,
>  		       dentry,
>  		       dentry->d_lockref.count,
>  		       dentry->d_sb->s_type->name,
> diff --git a/fs/eventpoll.c b/fs/eventpoll.c
> index 5714e900567c499739bb205f43bb6bf73f7ebe54..4ccd4d2e31adf571f939d2e777123e40302e565f 100644
> --- a/fs/eventpoll.c
> +++ b/fs/eventpoll.c
> @@ -1080,7 +1080,7 @@ static void ep_show_fdinfo(struct seq_file *m, struct file *f)
>  		struct inode *inode = file_inode(epi->ffd.file);
>  
>  		seq_printf(m, "tfd: %8d events: %8x data: %16llx "
> -			   " pos:%lli ino:%lx sdev:%x\n",
> +			   " pos:%lli ino:%llx sdev:%x\n",
>  			   epi->ffd.fd, epi->event.events,
>  			   (long long)epi->event.data,
>  			   (long long)epi->ffd.file->f_pos,
> diff --git a/fs/fserror.c b/fs/fserror.c
> index 06ca86adab9b769dfb72ec58b9e51627abee5152..1e4d11fd9562fd158a23b64ca60e9b7e01719cb8 100644
> --- a/fs/fserror.c
> +++ b/fs/fserror.c
> @@ -176,7 +176,7 @@ void fserror_report(struct super_block *sb, struct inode *inode,
>  lost:
>  	if (inode)
>  		pr_err_ratelimited(
> - "%s: lost file I/O error report for ino %lu type %u pos 0x%llx len 0x%llx error %d",
> + "%s: lost file I/O error report for ino %llu type %u pos 0x%llx len 0x%llx error %d",
>  		       sb->s_id, inode->i_ino, type, pos, len, error);
>  	else
>  		pr_err_ratelimited(
> diff --git a/fs/pipe.c b/fs/pipe.c
> index b44a756c0b4165edc2801b2290bf35480245d7a6..9841648c9cf3e8e569cf6ba5c792624fe92396f5 100644
> --- a/fs/pipe.c
> +++ b/fs/pipe.c
> @@ -873,7 +873,7 @@ static struct vfsmount *pipe_mnt __ro_after_init;
>   */
>  static char *pipefs_dname(struct dentry *dentry, char *buffer, int buflen)
>  {
> -	return dynamic_dname(buffer, buflen, "pipe:[%lu]",
> +	return dynamic_dname(buffer, buflen, "pipe:[%llu]",
>  				d_inode(dentry)->i_ino);
>  }
>  
> 
> -- 
> 2.53.0
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
