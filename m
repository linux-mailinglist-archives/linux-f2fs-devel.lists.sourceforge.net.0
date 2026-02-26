Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOBPOQqMoGkNkwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 19:08:10 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC52E1AD44D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 19:08:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6/rhiLh032UJyczUjlMHZVDhQa1ImdLHtzncmwTYR8=; b=Aj6F57EnY0dwbFMybrJLAX+dAq
	d8mj5rf2xxjBl/lFG1P+WByRz1I4vOWkeM9qrUJc3UPqbMCNTgKrZ3s2ufQA2lRZo4mNCEwLK86YO
	BJKXFoO8V05vEJA++Zplr/KUG/yaXxo+DDKYsh61ESh1Fjn7NjiJGp/ggzfz25Tb7BIU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvfmE-0000Mf-BR;
	Thu, 26 Feb 2026 18:07:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rostedt@goodmis.org>) id 1vvfmC-0000MG-D4;
 Thu, 26 Feb 2026 18:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bTsBrh0/JJpmr0ozgKj1bSn4tu0CAhfgIB+rtG/liWg=; b=Di2EQ3gYNmHshB8ERKvbb3qjEW
 30glhO8UBkUBmJHPS3Al59Tn5q6FLBRdkw9u9/ssIWAjD41ofwXBLNVgWd1lsULB/RoiXBgwqveTn
 CytwqlAOXHeWthdCrpSZF5vVYHoz2P8FjSLx6RzFLxPsqa+hKUAtbL/15WaM1e3TUYUQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bTsBrh0/JJpmr0ozgKj1bSn4tu0CAhfgIB+rtG/liWg=; b=JRGdTcNUWS0a4qihsGfhZHsszN
 4DATNp1uromb7qnMcshWB2dcpdPLN9OTLeM84EpslUP/x15rMuGTF7ozi69twYlcqhEuWuJf7yLVO
 5+8ULK2vzC63o+cQ0fWSHcavym8gJzlzYUa41yPC/AoEXO+slckoWq7OLe5C4+6puuzw=;
Received: from smtprelay0010.hostedemail.com ([216.40.44.10]
 helo=relay.hostedemail.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvfmB-0005Y7-Td; Thu, 26 Feb 2026 18:07:53 +0000
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay10.hostedemail.com (Postfix) with ESMTP id 9B550C18DE;
 Thu, 26 Feb 2026 17:49:29 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf16.hostedemail.com (Postfix) with ESMTPA id 0C2A820013; 
 Thu, 26 Feb 2026 17:48:19 +0000 (UTC)
Date: Thu, 26 Feb 2026 12:48:42 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20260226124842.5593ed85@gandalf.local.home>
In-Reply-To: <20260226-iino-u64-v1-3-ccceff366db9@kernel.org>
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
 <20260226-iino-u64-v1-3-ccceff366db9@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Stat-Signature: damti5nkpo3rmfwz917hnuttm1amr8ic
X-Spam-Status: No, score=1.40
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19n7opbcweo9pTbfl6jz5Em5ut1V76YmBI=
X-HE-Tag: 1772128099-759604
X-HE-Meta: U2FsdGVkX19YBiZrX7/HEnud2kaenQ2+Ma6+NxrKEmbsxiLABYFFYkdJrBExNdiY39W67VLkBDtwXzGv3EPcKM50OioPPDPiBUtgsH3IXqtdwdul3uQ4XZfTwBdj0Qe0+RoOmuo3YlnB0vfwHD3QDx2UXnccSIZZsirynjLllCm46TuUsJvWhuCUvhMBKAyTp7B91ws+2cD2cjlW2y//1+I8r7mG4vY0A3+ZciAJidxKUiocg3TXC/OZg/hDATDWRI0lEPqnDTGat8r2S3FK29HJ+w94QrTITkW6E3JbUOqwIW7ruM2Ifvi2n7cVBi0fnCkRJvKFHHaMkrPeFykh7oh6x6a/TqmR
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu,
 26 Feb 2026 10:55:05 -0500 Jeff Layton <jlayton@kernel.org>
 wrote: > Update trace event definitions in VFS-layer trace headers to use
 u64 > instead of ino_t/unsigned long for inode number fields, and change
 > format strings from %lu/%lx to %llu/%llx to match. > > Thi [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [216.40.44.10 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [216.40.44.10 listed in wl.mailspike.net]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vvfmB-0005Y7-Td
Subject: Re: [f2fs-dev] [PATCH 03/61] trace: update VFS-layer trace events
 for u64 i_ino
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
 Paulo Alcantara <pc@manguebit.org>, "Darrick
 J. Wong" <djwong@kernel.org>, Anders Larsen <al@alarsen.net>,
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
 Jaegeuk Kim <jaegeuk@kernel.org>, fsverity@lists.linux.dev, "Theodore Y.
 Ts'o" <tytso@mit.edu>, Nicolas Pitre <nico@fluxnic.net>,
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
 Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>, "Serge
 E. Hallyn" <serge@hallyn.com>, Amir Goldstein <amir73il@gmail.com>,
 James Clark <james.clark@linaro.org>, autofs@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 samba-technical@lists.samba.org, Ondrej Mosnacek <omosnace@redhat.com>,
 Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	FREEMAIL_CC(0.00)[ionkov.net,lists.linux.dev,manguebit.org,kernel.org,alarsen.net,lists.freedesktop.org,vger.kernel.org,linaro.org,omnibond.com,namei.org,tyhicks.com,infradead.org,lists.orangefs.org,microsoft.com,dev.tdt.de,cs.cmu.edu,google.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,oracle.com,suse.com,amd.com,arm.com,linux.ibm.com,redhat.com,ffwll.ch,paul-moore.com,coda.cs.cmu.edu,vivo.com,lists.linaro.org,schaufler-ca.com,mit.edu,fluxnic.net,linux.dev,huawei.com,davemloft.net,linux.intel.com,lists.sourceforge.net,lists.infradead.org,auristor.com,themaw.net,wdc.com,szeredi.hu,dubeyko.com,brown.name,hallyn.com,efficios.com,intel.com,suse.de,paragon-software.com,kvack.org,lists.samba.org,samba.org,suse.cz,codewreck.org,crudebyte.com,linux.alibaba.com,dilger.ca,artax.karlin.mff.cuni.cz,nod.at,fasheh.com,lists.ubuntu.com,talpey.com,canonical.com,evilplan.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	RCPT_COUNT_GT_50(0.00)[143];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	NEURAL_HAM(-0.00)[-0.975];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,gandalf.local.home:mid]
X-Rspamd-Queue-Id: DC52E1AD44D
X-Rspamd-Action: no action

On Thu, 26 Feb 2026 10:55:05 -0500
Jeff Layton <jlayton@kernel.org> wrote:

> Update trace event definitions in VFS-layer trace headers to use u64
> instead of ino_t/unsigned long for inode number fields, and change
> format strings from %lu/%lx to %llu/%llx to match.
> 
> This is needed because i_ino is now u64. Changing trace event field
> types changes the binary trace format, but the self-describing format
> metadata handles this transparently for modern trace-cmd and perf.
> 
> Files updated:
>   - cachefiles.h, filelock.h, filemap.h, fs_dax.h, fsverity.h,
>     hugetlbfs.h, netfs.h, readahead.h, timestamp.h, writeback.h
> 

Hmm, on 32 bit systems, this will likely cause "holes" in a lot of these
events.

> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  include/trace/events/cachefiles.h |  18 ++---
>  include/trace/events/filelock.h   |  16 ++---
>  include/trace/events/filemap.h    |  20 +++---
>  include/trace/events/fs_dax.h     |  20 +++---
>  include/trace/events/fsverity.h   |  30 ++++----
>  include/trace/events/hugetlbfs.h  |  28 ++++----
>  include/trace/events/netfs.h      |   4 +-
>  include/trace/events/readahead.h  |  12 ++--
>  include/trace/events/timestamp.h  |  12 ++--
>  include/trace/events/writeback.h  | 148 +++++++++++++++++++-------------------
>  10 files changed, 154 insertions(+), 154 deletions(-)
> 
> diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
> index a743b2a35ea7001447b3e05d41539cb88013bc7f..f967027711ee823f224abc1b8ab03f63da06ae6f 100644
> --- a/include/trace/events/cachefiles.h
> +++ b/include/trace/events/cachefiles.h
> @@ -251,8 +251,8 @@ TRACE_EVENT(cachefiles_lookup,
>  	    TP_STRUCT__entry(
>  		    __field(unsigned int,		obj)
>  		    __field(short,			error)

There was already a 2 byte hole here, but that's not a big deal.

> -		    __field(unsigned long,		dino)
> -		    __field(unsigned long,		ino)
> +		    __field(u64,			dino)
> +		    __field(u64,			ino)
>  			     ),
>  
>  	    TP_fast_assign(
> @@ -263,7 +263,7 @@ TRACE_EVENT(cachefiles_lookup,
>  		    __entry->error	= IS_ERR(de) ? PTR_ERR(de) : 0;
>  			   ),
>  
> -	    TP_printk("o=%08x dB=%lx B=%lx e=%d",
> +	    TP_printk("o=%08x dB=%llx B=%llx e=%d",
>  		      __entry->obj, __entry->dino, __entry->ino, __entry->error)
>  	    );
>  
> @@ -579,7 +579,7 @@ TRACE_EVENT(cachefiles_mark_active,
>  	    /* Note that obj may be NULL */
>  	    TP_STRUCT__entry(
>  		    __field(unsigned int,		obj)
> -		    __field(ino_t,			inode)
> +		    __field(u64,			inode)

Might be better to reorder any of these that have int first.

		u64	inode;
		int	obj;

Will be packed tighter than:

		int	obj
		u64	inode;

Probably should have changed that before anyway.

>  			     ),
>  
>  	    TP_fast_assign(
> @@ -587,7 +587,7 @@ TRACE_EVENT(cachefiles_mark_active,
>  		    __entry->inode	= inode->i_ino;
>  			   ),
>  
> -	    TP_printk("o=%08x B=%lx",
> +	    TP_printk("o=%08x B=%llx",
>  		      __entry->obj, __entry->inode)
>  	    );
>  
> @@ -600,7 +600,7 @@ TRACE_EVENT(cachefiles_mark_failed,
>  	    /* Note that obj may be NULL */
>  	    TP_STRUCT__entry(
>  		    __field(unsigned int,		obj)
> -		    __field(ino_t,			inode)
> +		    __field(u64,			inode)

Is ino_t being changed? Why the update here?

>  			     ),
>  
>  	    TP_fast_assign(
> @@ -608,7 +608,7 @@ TRACE_EVENT(cachefiles_mark_failed,
>  		    __entry->inode	= inode->i_ino;
>  			   ),
>  
> -	    TP_printk("o=%08x B=%lx",
> +	    TP_printk("o=%08x B=%llx",
>  		      __entry->obj, __entry->inode)
>  	    );
>  
> @@ -621,7 +621,7 @@ TRACE_EVENT(cachefiles_mark_inactive,
>  	    /* Note that obj may be NULL */
>  	    TP_STRUCT__entry(
>  		    __field(unsigned int,		obj)
> -		    __field(ino_t,			inode)
> +		    __field(u64,			inode)

Ditto.

>  			     ),
>  
>  	    TP_fast_assign(
> @@ -629,7 +629,7 @@ TRACE_EVENT(cachefiles_mark_inactive,
>  		    __entry->inode	= inode->i_ino;
>  			   ),
>  
> -	    TP_printk("o=%08x B=%lx",
> +	    TP_printk("o=%08x B=%llx",
>  		      __entry->obj, __entry->inode)
>  	    );
>  
> diff --git a/include/trace/events/filelock.h b/include/trace/events/filelock.h
> index 370016c38a5bbc07d5ba6c102030b49c9eb6424d..41bc752616b25d6cd7955203e2c604029d0b440c 100644
> --- a/include/trace/events/filelock.h
> +++ b/include/trace/events/filelock.h
> @@ -42,7 +42,7 @@ TRACE_EVENT(locks_get_lock_context,
>  	TP_ARGS(inode, type, ctx),
>  
>  	TP_STRUCT__entry(
> -		__field(unsigned long, i_ino)
> +		__field(u64, i_ino)
>  		__field(dev_t, s_dev)
>  		__field(unsigned char, type)
>  		__field(struct file_lock_context *, ctx)
> @@ -55,7 +55,7 @@ TRACE_EVENT(locks_get_lock_context,
>  		__entry->ctx = ctx;
>  	),
>  
> -	TP_printk("dev=0x%x:0x%x ino=0x%lx type=%s ctx=%p",
> +	TP_printk("dev=0x%x:0x%x ino=0x%llx type=%s ctx=%p",
>  		  MAJOR(__entry->s_dev), MINOR(__entry->s_dev),
>  		  __entry->i_ino, show_fl_type(__entry->type), __entry->ctx)
>  );
> @@ -67,7 +67,7 @@ DECLARE_EVENT_CLASS(filelock_lock,
>  
>  	TP_STRUCT__entry(
>  		__field(struct file_lock *, fl)
> -		__field(unsigned long, i_ino)
> +		__field(u64, i_ino)

Having u64 before a pointer would be tighter on 32 bit systems, and leaves
out any holes in the trace.

>  		__field(dev_t, s_dev)
>  		__field(struct file_lock_core *, blocker)
>  		__field(fl_owner_t, owner)
> @@ -93,7 +93,7 @@ DECLARE_EVENT_CLASS(filelock_lock,
>  		__entry->ret = ret;
>  	),
>  
> -	TP_printk("fl=%p dev=0x%x:0x%x ino=0x%lx fl_blocker=%p fl_owner=%p fl_pid=%u fl_flags=%s fl_type=%s fl_start=%lld fl_end=%lld ret=%d",
> +	TP_printk("fl=%p dev=0x%x:0x%x ino=0x%llx fl_blocker=%p fl_owner=%p fl_pid=%u fl_flags=%s fl_type=%s fl_start=%lld fl_end=%lld ret=%d",
>  		__entry->fl, MAJOR(__entry->s_dev), MINOR(__entry->s_dev),
>  		__entry->i_ino, __entry->blocker, __entry->owner,
>  		__entry->pid, show_fl_flags(__entry->flags),
> @@ -124,7 +124,7 @@ DECLARE_EVENT_CLASS(filelock_lease,
>  
>  	TP_STRUCT__entry(
>  		__field(struct file_lease *, fl)
> -		__field(unsigned long, i_ino)
> +		__field(u64, i_ino)

Same here.

>  		__field(dev_t, s_dev)
>  		__field(struct file_lock_core *, blocker)
>  		__field(fl_owner_t, owner)
> @@ -146,7 +146,7 @@ DECLARE_EVENT_CLASS(filelock_lease,
>  		__entry->downgrade_time = fl ? fl->fl_downgrade_time : 0;
>  	),
>  
> -	TP_printk("fl=%p dev=0x%x:0x%x ino=0x%lx fl_blocker=%p fl_owner=%p fl_flags=%s fl_type=%s fl_break_time=%lu fl_downgrade_time=%lu",
> +	TP_printk("fl=%p dev=0x%x:0x%x ino=0x%llx fl_blocker=%p fl_owner=%p fl_flags=%s fl_type=%s fl_break_time=%lu fl_downgrade_time=%lu",
>  		__entry->fl, MAJOR(__entry->s_dev), MINOR(__entry->s_dev),
>  		__entry->i_ino, __entry->blocker, __entry->owner,
>  		show_fl_flags(__entry->flags),
> @@ -175,7 +175,7 @@ TRACE_EVENT(generic_add_lease,
>  	TP_ARGS(inode, fl),
>  
>  	TP_STRUCT__entry(
> -		__field(unsigned long, i_ino)
> +		__field(u64, i_ino)
>  		__field(int, wcount)
>  		__field(int, rcount)
>  		__field(int, icount)
> @@ -196,7 +196,7 @@ TRACE_EVENT(generic_add_lease,
>  		__entry->type = fl->c.flc_type;
>  	),
>  
> -	TP_printk("dev=0x%x:0x%x ino=0x%lx wcount=%d rcount=%d icount=%d fl_owner=%p fl_flags=%s fl_type=%s",
> +	TP_printk("dev=0x%x:0x%x ino=0x%llx wcount=%d rcount=%d icount=%d fl_owner=%p fl_flags=%s fl_type=%s",
>  		MAJOR(__entry->s_dev), MINOR(__entry->s_dev),
>  		__entry->i_ino, __entry->wcount, __entry->rcount,
>  		__entry->icount, __entry->owner,
> diff --git a/include/trace/events/filemap.h b/include/trace/events/filemap.h
> index f48fe637bfd25885dc6daaf09336ab60626b4944..153491e57cce6df73e30ddee60a52ed7d8923c24 100644
> --- a/include/trace/events/filemap.h
> +++ b/include/trace/events/filemap.h
> @@ -21,7 +21,7 @@ DECLARE_EVENT_CLASS(mm_filemap_op_page_cache,
>  
>  	TP_STRUCT__entry(
>  		__field(unsigned long, pfn)
> -		__field(unsigned long, i_ino)
> +		__field(u64, i_ino)

Again, this would cause a 32 bit hole.

>  		__field(unsigned long, index)
>  		__field(dev_t, s_dev)
>  		__field(unsigned char, order)
> @@ -38,7 +38,7 @@ DECLARE_EVENT_CLASS(mm_filemap_op_page_cache,
>  		__entry->order = folio_order(folio);
>  	),
>  
> -	TP_printk("dev %d:%d ino %lx pfn=0x%lx ofs=%lu order=%u",
> +	TP_printk("dev %d:%d ino %llx pfn=0x%lx ofs=%lu order=%u",
>  		MAJOR(__entry->s_dev), MINOR(__entry->s_dev),
>  		__entry->i_ino,
>  		__entry->pfn,
> @@ -67,7 +67,7 @@ DECLARE_EVENT_CLASS(mm_filemap_op_page_cache_range,
>  	TP_ARGS(mapping, index, last_index),
>  
>  	TP_STRUCT__entry(
> -		__field(unsigned long, i_ino)
> +		__field(u64, i_ino)
>  		__field(dev_t, s_dev)
>  		__field(unsigned long, index)
>  		__field(unsigned long, last_index)
> @@ -85,7 +85,7 @@ DECLARE_EVENT_CLASS(mm_filemap_op_page_cache_range,
>  	),
>  
>  	TP_printk(
> -		"dev=%d:%d ino=%lx ofs=%lld-%lld",
> +		"dev=%d:%d ino=%llx ofs=%lld-%lld",
>  		MAJOR(__entry->s_dev),
>  		MINOR(__entry->s_dev), __entry->i_ino,
>  		((loff_t)__entry->index) << PAGE_SHIFT,
> @@ -117,7 +117,7 @@ TRACE_EVENT(mm_filemap_fault,
>  	TP_ARGS(mapping, index),
>  
>  	TP_STRUCT__entry(
> -		__field(unsigned long, i_ino)
> +		__field(u64, i_ino)
>  		__field(dev_t, s_dev)
>  		__field(unsigned long, index)
>  	),
> @@ -133,7 +133,7 @@ TRACE_EVENT(mm_filemap_fault,
>  	),
>  
>  	TP_printk(
> -		"dev=%d:%d ino=%lx ofs=%lld",
> +		"dev=%d:%d ino=%llx ofs=%lld",
>  		MAJOR(__entry->s_dev),
>  		MINOR(__entry->s_dev), __entry->i_ino,
>  		((loff_t)__entry->index) << PAGE_SHIFT
> @@ -146,7 +146,7 @@ TRACE_EVENT(filemap_set_wb_err,
>  		TP_ARGS(mapping, eseq),
>  
>  		TP_STRUCT__entry(
> -			__field(unsigned long, i_ino)
> +			__field(u64, i_ino)
>  			__field(dev_t, s_dev)
>  			__field(errseq_t, errseq)
>  		),
> @@ -160,7 +160,7 @@ TRACE_EVENT(filemap_set_wb_err,
>  				__entry->s_dev = mapping->host->i_rdev;
>  		),
>  
> -		TP_printk("dev=%d:%d ino=0x%lx errseq=0x%x",
> +		TP_printk("dev=%d:%d ino=0x%llx errseq=0x%x",
>  			MAJOR(__entry->s_dev), MINOR(__entry->s_dev),
>  			__entry->i_ino, __entry->errseq)
>  );
> @@ -172,7 +172,7 @@ TRACE_EVENT(file_check_and_advance_wb_err,
>  
>  		TP_STRUCT__entry(
>  			__field(struct file *, file)
> -			__field(unsigned long, i_ino)
> +			__field(u64, i_ino)

Having a pointer after the u64 is better.

>  			__field(dev_t, s_dev)
>  			__field(errseq_t, old)
>  			__field(errseq_t, new)
> @@ -191,7 +191,7 @@ TRACE_EVENT(file_check_and_advance_wb_err,
>  			__entry->new = file->f_wb_err;
>  		),
>  
> -		TP_printk("file=%p dev=%d:%d ino=0x%lx old=0x%x new=0x%x",
> +		TP_printk("file=%p dev=%d:%d ino=0x%llx old=0x%x new=0x%x",
>  			__entry->file, MAJOR(__entry->s_dev),
>  			MINOR(__entry->s_dev), __entry->i_ino, __entry->old,
>  			__entry->new)
> diff --git a/include/trace/events/fs_dax.h b/include/trace/events/fs_dax.h
> index 50ebc1290ab062a9c30ab00049fb96691f9a0f23..11121baa8ece7928c653b4f874fb10ffbdd02fd0 100644
> --- a/include/trace/events/fs_dax.h
> +++ b/include/trace/events/fs_dax.h
> @@ -12,7 +12,7 @@ DECLARE_EVENT_CLASS(dax_pmd_fault_class,
>  		pgoff_t max_pgoff, int result),
>  	TP_ARGS(inode, vmf, max_pgoff, result),
>  	TP_STRUCT__entry(
> -		__field(unsigned long, ino)
> +		__field(u64, ino)
>  		__field(unsigned long, vm_start)
>  		__field(unsigned long, vm_end)
>  		__field(vm_flags_t, vm_flags)
> @@ -35,7 +35,7 @@ DECLARE_EVENT_CLASS(dax_pmd_fault_class,
>  		__entry->max_pgoff = max_pgoff;
>  		__entry->result = result;
>  	),
> -	TP_printk("dev %d:%d ino %#lx %s %s address %#lx vm_start "
> +	TP_printk("dev %d:%d ino %#llx %s %s address %#lx vm_start "
>  			"%#lx vm_end %#lx pgoff %#lx max_pgoff %#lx %s",
>  		MAJOR(__entry->dev),
>  		MINOR(__entry->dev),
> @@ -66,7 +66,7 @@ DECLARE_EVENT_CLASS(dax_pmd_load_hole_class,
>  		void *radix_entry),
>  	TP_ARGS(inode, vmf, zero_folio, radix_entry),
>  	TP_STRUCT__entry(
> -		__field(unsigned long, ino)
> +		__field(u64, ino)
>  		__field(vm_flags_t, vm_flags)
>  		__field(unsigned long, address)
>  		__field(struct folio *, zero_folio)
> @@ -81,7 +81,7 @@ DECLARE_EVENT_CLASS(dax_pmd_load_hole_class,
>  		__entry->zero_folio = zero_folio;
>  		__entry->radix_entry = radix_entry;
>  	),
> -	TP_printk("dev %d:%d ino %#lx %s address %#lx zero_folio %p "
> +	TP_printk("dev %d:%d ino %#llx %s address %#lx zero_folio %p "
>  			"radix_entry %#lx",
>  		MAJOR(__entry->dev),
>  		MINOR(__entry->dev),
> @@ -106,7 +106,7 @@ DECLARE_EVENT_CLASS(dax_pte_fault_class,
>  	TP_PROTO(struct inode *inode, struct vm_fault *vmf, int result),
>  	TP_ARGS(inode, vmf, result),
>  	TP_STRUCT__entry(
> -		__field(unsigned long, ino)
> +		__field(u64, ino)
>  		__field(vm_flags_t, vm_flags)
>  		__field(unsigned long, address)
>  		__field(pgoff_t, pgoff)
> @@ -123,7 +123,7 @@ DECLARE_EVENT_CLASS(dax_pte_fault_class,
>  		__entry->pgoff = vmf->pgoff;
>  		__entry->result = result;
>  	),
> -	TP_printk("dev %d:%d ino %#lx %s %s address %#lx pgoff %#lx %s",
> +	TP_printk("dev %d:%d ino %#llx %s %s address %#lx pgoff %#lx %s",
>  		MAJOR(__entry->dev),
>  		MINOR(__entry->dev),
>  		__entry->ino,
> @@ -150,7 +150,7 @@ DECLARE_EVENT_CLASS(dax_writeback_range_class,
>  	TP_PROTO(struct inode *inode, pgoff_t start_index, pgoff_t end_index),
>  	TP_ARGS(inode, start_index, end_index),
>  	TP_STRUCT__entry(
> -		__field(unsigned long, ino)
> +		__field(u64, ino)
>  		__field(pgoff_t, start_index)
>  		__field(pgoff_t, end_index)
>  		__field(dev_t, dev)
> @@ -161,7 +161,7 @@ DECLARE_EVENT_CLASS(dax_writeback_range_class,
>  		__entry->start_index = start_index;
>  		__entry->end_index = end_index;
>  	),
> -	TP_printk("dev %d:%d ino %#lx pgoff %#lx-%#lx",
> +	TP_printk("dev %d:%d ino %#llx pgoff %#lx-%#lx",
>  		MAJOR(__entry->dev),
>  		MINOR(__entry->dev),
>  		__entry->ino,
> @@ -182,7 +182,7 @@ TRACE_EVENT(dax_writeback_one,
>  	TP_PROTO(struct inode *inode, pgoff_t pgoff, pgoff_t pglen),
>  	TP_ARGS(inode, pgoff, pglen),
>  	TP_STRUCT__entry(
> -		__field(unsigned long, ino)
> +		__field(u64, ino)
>  		__field(pgoff_t, pgoff)
>  		__field(pgoff_t, pglen)
>  		__field(dev_t, dev)
> @@ -193,7 +193,7 @@ TRACE_EVENT(dax_writeback_one,
>  		__entry->pgoff = pgoff;
>  		__entry->pglen = pglen;
>  	),
> -	TP_printk("dev %d:%d ino %#lx pgoff %#lx pglen %#lx",
> +	TP_printk("dev %d:%d ino %#llx pgoff %#lx pglen %#lx",
>  		MAJOR(__entry->dev),
>  		MINOR(__entry->dev),
>  		__entry->ino,
> diff --git a/include/trace/events/fsverity.h b/include/trace/events/fsverity.h
> index a8c52f21cbd5eb010c7e7b2fdb8f9de49c8ea326..4477c17e05748360965c4e1840590efe96d6335e 100644
> --- a/include/trace/events/fsverity.h
> +++ b/include/trace/events/fsverity.h
> @@ -16,7 +16,7 @@ TRACE_EVENT(fsverity_enable,
>  		 const struct merkle_tree_params *params),
>  	TP_ARGS(inode, params),
>  	TP_STRUCT__entry(
> -		__field(ino_t, ino)
> +		__field(u64, ino)

Do you need to convert all these ino_t's?

>  		__field(u64, data_size)
>  		__field(u64, tree_size)
>  		__field(unsigned int, merkle_block)
> @@ -29,8 +29,8 @@ TRACE_EVENT(fsverity_enable,
>  		__entry->merkle_block = params->block_size;
>  		__entry->num_levels = params->num_levels;
>  	),
> -	TP_printk("ino %lu data_size %llu tree_size %llu merkle_block %u levels %u",
> -		(unsigned long) __entry->ino,
> +	TP_printk("ino %llu data_size %llu tree_size %llu merkle_block %u levels %u",
> +		__entry->ino,
>  		__entry->data_size,
>  		__entry->tree_size,
>  		__entry->merkle_block,
> @@ -42,7 +42,7 @@ TRACE_EVENT(fsverity_tree_done,
>  		 const struct merkle_tree_params *params),
>  	TP_ARGS(inode, vi, params),
>  	TP_STRUCT__entry(
> -		__field(ino_t, ino)
> +		__field(u64, ino)
>  		__field(u64, data_size)
>  		__field(u64, tree_size)
>  		__field(unsigned int, merkle_block)
> @@ -59,8 +59,8 @@ TRACE_EVENT(fsverity_tree_done,
>  		memcpy(__get_dynamic_array(root_hash), vi->root_hash, __get_dynamic_array_len(root_hash));
>  		memcpy(__get_dynamic_array(file_digest), vi->file_digest, __get_dynamic_array_len(file_digest));
>  	),
> -	TP_printk("ino %lu data_size %llu tree_size %lld merkle_block %u levels %u root_hash %s digest %s",
> -		(unsigned long) __entry->ino,
> +	TP_printk("ino %llu data_size %llu tree_size %lld merkle_block %u levels %u root_hash %s digest %s",
> +		__entry->ino,
>  		__entry->data_size,
>  		__entry->tree_size,
>  		__entry->merkle_block,
> @@ -75,7 +75,7 @@ TRACE_EVENT(fsverity_verify_data_block,
>  		 u64 data_pos),
>  	TP_ARGS(inode, params, data_pos),
>  	TP_STRUCT__entry(
> -		__field(ino_t, ino)
> +		__field(u64, ino)
>  		__field(u64, data_pos)
>  		__field(unsigned int, merkle_block)
>  	),
> @@ -84,8 +84,8 @@ TRACE_EVENT(fsverity_verify_data_block,
>  		__entry->data_pos = data_pos;
>  		__entry->merkle_block = params->block_size;
>  	),
> -	TP_printk("ino %lu data_pos %llu merkle_block %u",
> -		(unsigned long) __entry->ino,
> +	TP_printk("ino %llu data_pos %llu merkle_block %u",
> +		__entry->ino,
>  		__entry->data_pos,
>  		__entry->merkle_block)
>  );
> @@ -96,7 +96,7 @@ TRACE_EVENT(fsverity_merkle_hit,
>  		 unsigned int hidx),
>  	TP_ARGS(inode, data_pos, hblock_idx, level, hidx),
>  	TP_STRUCT__entry(
> -		__field(ino_t, ino)
> +		__field(u64, ino)
>  		__field(u64, data_pos)

Heh, this actually removed a hole, but again, why convert ino_t?

Anyway, I stopped here. But you get the idea.

-- Steve

>  		__field(unsigned long, hblock_idx)
>  		__field(unsigned int, level)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
