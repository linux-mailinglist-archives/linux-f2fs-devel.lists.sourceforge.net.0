Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFSfJge6oGnClwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 22:24:23 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D5F1AFB77
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 22:24:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkSh8vizhEGIE7NgAPAfI1EGrpkFWZ3Vdty1oAUkgTo=; b=US4hHUwUFZZJwaGT/g0HV4Bfym
	wdEaNZ1fFbid3FYzWqBhcX3PBJYLOVV9zh93Xhp6Kme8nMnwDnPedLK8PxndHqpjnPYkcqwuJTSD7
	X20qLOz/agOrmGooY8Wn6Hfjg1zF5aR4cWepG0HDSQZiRwUXGmmYjH/B6Ipo7gu3l4kE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vviqL-0001Y1-T9;
	Thu, 26 Feb 2026 21:24:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <richard@nod.at>) id 1vviqJ-0001Xa-NM;
 Thu, 26 Feb 2026 21:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b5speBzLOx9O3ZQa1YCvB0Y54PAq8tRZnmBFWuQK5aQ=; b=FcdMuxqvNnxwZ3mBFO0xTpVIiS
 z+iJSq9e38NPF0cVhvlRvPlIlogO/V68on2nbVpx7I4qCtR2RVHneLuJajZNS6U2ZDPFqRe02JF3Q
 8CEwSxQ8cleqgYJfXK2gA8t1wsgPIMYH1EfIaYdLPOFap2/TUR58HlsGp999/3udM3ks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
 In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b5speBzLOx9O3ZQa1YCvB0Y54PAq8tRZnmBFWuQK5aQ=; b=JaWF8AjFevR3pvTCPf/92h6AEG
 pQVWFHuTQNhm3c+GsRKhQzHFwPKSMKbKawjz29Cb5iY1U37ClqcxLyP+FCGoj3DFUfRn2WE1jglZJ
 YRxonTtilpPPk4Ns9bJp3//EufWKGVLCtM93BfHpnBlNkEBArRjcbG2TJWDk/qOBxE5s=;
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vviqI-000666-Vt; Thu, 26 Feb 2026 21:24:19 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8F3C528F9E9;
 Thu, 26 Feb 2026 22:06:12 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id iWyiIX5CRUJd; Thu, 26 Feb 2026 22:06:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9FBFB29859D;
 Thu, 26 Feb 2026 22:06:10 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id cwbgIi8mwQ6r; Thu, 26 Feb 2026 22:06:09 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1868E298580;
 Thu, 26 Feb 2026 22:06:08 +0100 (CET)
Date: Thu, 26 Feb 2026 22:06:07 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <909001762.1963.1772139967060.JavaMail.zimbra@nod.at>
In-Reply-To: <20260226-iino-u64-v1-47-ccceff366db9@kernel.org>
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
 <20260226-iino-u64-v1-47-ccceff366db9@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF147
 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: update format strings for u64 i_ino
Thread-Index: W1YwJFGUiVxHsVs+FtVDAklXBDhaRQ==
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  ----- Ursprüngliche Mail ----- > Von: "Jeff Layton" <jlayton@kernel.org>
    > Update format strings and local variable types in ubifs for the > i_ino
    type change from unsigned long to u64. > > Signed-of [...] 
 
 Content analysis details:   (0.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vviqI-000666-Vt
Subject: Re: [f2fs-dev] [PATCH 47/61] ubifs: update format strings for u64
 i_ino
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
 Anders Larsen <al@alarsen.net>,
 DRI mailing list <dri-devel@lists.freedesktop.org>, linux-hams@vger.kernel.org,
 sumit semwal <sumit.semwal@linaro.org>, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs <linux-xfs@vger.kernel.org>, Fan Wu <wufan@kernel.org>,
 ceph-devel <ceph-devel@vger.kernel.org>, James Morris <jmorris@namei.org>,
 Tyler Hicks <code@tyhicks.com>, Christoph Hellwig <hch@infradead.org>,
 devel <devel@lists.orangefs.org>, Shyam <sprasad@microsoft.com>,
 Martin Schiller <ms@dev.tdt.de>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Willem de Bruijn <willemb@google.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 linux-fscrypt <linux-fscrypt@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Hildenbrand <david@kernel.org>, Eric Van Hensbergen <ericvh@kernel.org>,
 Christian Brauner <brauner@kernel.org>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org,
 chuck lever <chuck.lever@oracle.com>, mhiramat <mhiramat@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org,
 Trond Myklebust <trondmy@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Dave Kleikamp <shaggy@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
 oleg <oleg@redhat.com>, edumazet <edumazet@google.com>,
 Simona Vetter <simona@ffwll.ch>, linux-cifs <linux-cifs@vger.kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 linux-nilfs <linux-nilfs@vger.kernel.org>, Paul Moore <paul@paul-moore.com>,
 codalist@coda.cs.cmu.edu,
 linux-trace-kernel <linux-trace-kernel@vger.kernel.org>,
 Olga Kornievskaia <okorniev@redhat.com>, Yangtao Li <frank.li@vivo.com>,
 selinux@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Casey Schaufler <casey@schaufler-ca.com>, netfs@lists.linux.dev,
 Jaegeuk Kim <jaegeuk@kernel.org>, fsverity@lists.linux.dev,
 tytso <tytso@mit.edu>, Nicolas Pitre <nico@fluxnic.net>,
 Muchun Song <muchun.song@linux.dev>, Roberto Sassu <roberto.sassu@huawei.com>,
 davem <davem@davemloft.net>, anna <anna@kernel.org>,
 linux-integrity <linux-integrity@vger.kernel.org>,
 Alex Markuze <amarkuze@redhat.com>, Martin Brandenburg <martin@omnibond.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 ocfs2-devel <ocfs2-devel@lists.linux.dev>,
 jfs-discussion <jfs-discussion@lists.sourceforge.net>,
 linux-mtd <linux-mtd@lists.infradead.org>, amd-gfx@lists.freedesktop.org,
 Marc Dionne <marc.dionne@auristor.com>,
 linux-afs <linux-afs@lists.infradead.org>, raven <raven@themaw.net>,
 Naohiro Aota <naohiro.aota@wdc.com>, Eric Biggers <ebiggers@kernel.org>,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>,
 NeilBrown <neil@brown.name>, Ilya Dryomov <idryomov@gmail.com>,
 pabeni <pabeni@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Amir Goldstein <amir73il@gmail.com>, James Clark <james.clark@linaro.org>,
 autofs@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Damien Le Moal <dlemoal@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 dan j williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-nfs <linux-nfs@vger.kernel.org>, linux-ext4 <linux-ext4@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Ondrej Mosnacek <omosnace@redhat.com>, Steve French <sfrench@samba.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, ntfs3 <ntfs3@lists.linux.dev>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Ian Rogers <irogers@google.com>, Alexander Aring <alex.aring@gmail.com>,
 Jan Kara <jack@suse.cz>, Peter Zijlstra <peterz@infradead.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 ecryptfs <ecryptfs@vger.kernel.org>,
 linux-unionfs <linux-unionfs@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>,
 David Airlie <airlied@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>,
 linux-x25@vger.kernel.org, Mark Fasheh <mark@fasheh.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, mingo <mingo@redhat.com>, kuba <kuba@kernel.org>,
 Salah Triki <salah.triki@gmail.com>, Simon Horman <horms@kernel.org>,
 apparmor@lists.ubuntu.com, Tom Talpey <tom@talpey.com>,
 Bharath SM <bharathsm@microsoft.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Namhyung Kim <namhyung@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 John Johansen <john.johansen@canonical.com>,
 Luis de Bethencourt <luisbg@kernel.org>, netdev <netdev@vger.kernel.org>,
 v9fs <v9fs@lists.linux.dev>, Adrian Hunter <adrian.hunter@intel.com>,
 LSM <linux-security-module@vger.kernel.org>,
 Johannes Thumshirn <jth@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[nod.at];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nod.at:mid,nod.at:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
	RCPT_COUNT_GT_50(0.00)[143];
	FROM_NEQ_ENVFROM(0.00)[richard@nod.at,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ionkov.net,lists.linux.dev,manguebit.org,kernel.org,alarsen.net,lists.freedesktop.org,vger.kernel.org,linaro.org,omnibond.com,namei.org,tyhicks.com,infradead.org,lists.orangefs.org,microsoft.com,dev.tdt.de,cs.cmu.edu,google.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,oracle.com,suse.com,amd.com,arm.com,linux.ibm.com,redhat.com,ffwll.ch,paul-moore.com,coda.cs.cmu.edu,vivo.com,lists.linaro.org,schaufler-ca.com,mit.edu,fluxnic.net,linux.dev,huawei.com,davemloft.net,linux.intel.com,lists.sourceforge.net,lists.infradead.org,auristor.com,themaw.net,wdc.com,szeredi.hu,dubeyko.com,brown.name,hallyn.com,goodmis.org,efficios.com,intel.com,suse.de,paragon-software.com,kvack.org,lists.samba.org,samba.org,suse.cz,codewreck.org,crudebyte.com,linux.alibaba.com,dilger.ca,artax.karlin.mff.cuni.cz,fasheh.com,lists.ubuntu.com,talpey.com,canonical.com,evilplan.org];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.246];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 34D5F1AFB77
X-Rspamd-Action: no action

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkplZmYgTGF5dG9uIiA8amxh
eXRvbkBrZXJuZWwub3JnPgo+IFVwZGF0ZSBmb3JtYXQgc3RyaW5ncyBhbmQgbG9jYWwgdmFyaWFi
bGUgdHlwZXMgaW4gdWJpZnMgZm9yIHRoZQo+IGlfaW5vIHR5cGUgY2hhbmdlIGZyb20gdW5zaWdu
ZWQgbG9uZyB0byB1NjQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmVmZiBMYXl0b24gPGpsYXl0b25A
a2VybmVsLm9yZz4KPiAtLS0KPiBmcy91Ymlmcy9kZWJ1Zy5jICAgfCAgOCArKysrLS0tLQo+IGZz
L3ViaWZzL2Rpci5jICAgICB8IDI4ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiBmcy91
Ymlmcy9maWxlLmMgICAgfCAyOCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gZnMvdWJp
ZnMvam91cm5hbC5jIHwgIDYgKysrLS0tCj4gZnMvdWJpZnMvc3VwZXIuYyAgIHwgMTYgKysrKysr
KystLS0tLS0tLQo+IGZzL3ViaWZzL3RuYy5jICAgICB8ICA0ICsrLS0KPiBmcy91Ymlmcy94YXR0
ci5jICAgfCAxNCArKysrKysrLS0tLS0tLQo+IDcgZmlsZXMgY2hhbmdlZCwgNTIgaW5zZXJ0aW9u
cygrKSwgNTIgZGVsZXRpb25zKC0pCgpBY2tlZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNo
YXJkQG5vZC5hdD4KClRoYW5rcywKLy9yaWNoYXJkCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
