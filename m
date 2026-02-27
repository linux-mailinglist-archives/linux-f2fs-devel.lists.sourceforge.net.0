Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDEYGcXOoWn3wQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 18:05:09 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7501BB2D1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 18:05:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtA6EQgoNGGmFChUZkjlmymVFArUnJXc62HnC5aa1Zc=; b=YTv8UdbqZYTgvTu6iA9dmlzNa4
	3HNXAX9Nj+CCvk5M0DPdcG+j7WdyVpsLmAtfvwIDS69Cq7VUmE0L475hGQ79uPLQAH2WS6uiUAGwK
	EBix1gq12v55lj61hzl6HyeIWbV712VGFvxWIhYoP+wrVsM6dM6D3926IUUnQekZXUWA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vw1Gp-0004ip-VY;
	Fri, 27 Feb 2026 17:04:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ryan.lee@canonical.com>) id 1vw1Gn-0004ii-Aq
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 17:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BKQzT9t7ZI3mb+6EDIKBTxaX0DX68JkIAcPYLBp08+M=; b=Hgbx5W/9zowmfLCOILgt0iD3gy
 3DLNuAEEGfYtg3V/IeK9ujX/Ou8oOPPbrjQ7wJ2Ykuz4pcJrpLUcYz+j9pokl6KupFTpFET0DChGl
 B0bSgwxkANuWLV1/531fc/3dovEPBjJ1XLvA5UEgvVm1PvdB0S0awFncC+N0jOZu+17k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BKQzT9t7ZI3mb+6EDIKBTxaX0DX68JkIAcPYLBp08+M=; b=U8Uqeage/EYGDPkVmZv0GX2BU6
 yz6CAmBUQ4R/+k5ANQPkE1/67wtAFpoItpiSXcahjFSQ6+9NrsYTVXyK9JSa08DfcQ+unEbiNIDdO
 nrY2Vy4CC+HUZNzCX6W37RuPraKjrDMAd/QB7RFREcLiLje0nDUNPwUnNqeCEkEKZKaI=;
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vw1Gl-0007x4-Eo for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 17:04:53 +0000
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 94B7C3FFD1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 27 Feb 2026 16:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1772210832;
 bh=BKQzT9t7ZI3mb+6EDIKBTxaX0DX68JkIAcPYLBp08+M=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=AsZRArcr+IHOjGSBnonu/oj477dSluZfbYqix5/Y3zCBdoV1+uw6mYYHWwc4sPEzW
 HjFcFZE09FnavTkEnrKbxmF0r3YbTQPiFMojDWqkufdWKDMCZW9OPxWmPLHGl8VYyP
 aEEDR142r/egN11v+6BUwh9UCjnO7iqcqVKNlvjuimRs6gHHfWgooiT0xYazkycZV9
 iGaNpfepDa56QYdI4I7j3O9bAMZ5DH4c2WTlkXndqNrhlLiQOUUvwizjaREzzR+RaW
 G6qhyP2mK34/AwEY8BsSjxU/P2yJBLCVcFF0FazsuIIhPpIJJoppDe/KKLv377XKJO
 ckRoiSwBJ3h5NMgLM0yT68s2FLDl6gyLkP/lRN3fVuLZu1yxgjda/ENN1odqNnDS9i
 cUltWCZdejwVb0iOVt7w8SJ+e7iURRxp5NxrVK346lnXyAMDOroqzltJLwTrKWTFrE
 AN4ruGpriTmmvQ9GwGNvr1LpOw6mwnclV+8SKwiXFM2kWGMs7WC4UqqVSYW/5oxS+O
 xoiqh6Acy+TYgniHFTAsDU75wpJzuZLSiIVgwW31LUadIpejlNvpg5EcfEaBbQmLVj
 NgnJJyPdPSKozzmB9LKkQNdrUwMQftfhfgs3hHlvFhllpGK5m8UgazcxDHxIY0+WhT
 Efp718XcrpREHjvzQoHFxdjs=
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-79868381229so23013127b3.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 27 Feb 2026 08:47:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772210831; cv=none;
 d=google.com; s=arc-20240605;
 b=JVr4dvxCAFbFjhxe/fqxm5jb2u1TNhT39NYQkjIT+oYa1BMQOh3/slvok3mdOcWwW/
 ttGCi8MF/xAxnM8fPT171yhKRbux5ITTyIN0SaeycYVDncT7fGkcdO3B9k28kPRASx61
 1wqa2XJFkKNmo5R8KN4C0ck3pmctsIH9wGzfP0sLKpj4+QCEd8YyKkjC+Wexu37/oV76
 vyOGHWe/gZQWq6StTyPGRWVzlZ3TR0mcPdQ5OJ4V23wGXLwKNcYX/9M2tDQJVeui+2s8
 M2f1HfXCtrR2+z4s6Q9Xo74ZNbbb6VQ1D1LOqEVMa4N+w2b7x/fKQcxY9JWF899EmOCt
 G3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version;
 bh=BKQzT9t7ZI3mb+6EDIKBTxaX0DX68JkIAcPYLBp08+M=;
 fh=oNAOG8IMpEuDT1lJre5uU9e6EP3lxwnc4I4NHC7LM3c=;
 b=ECZdTH+lS5ck6SqK657FOtwIJpbjtI1BAhnyNPqCoQwUjjrEZIYzMGN0KUdFxVRAc6
 UKBIf5E/HyIIp6JtHAz2jahBtQDNx7aaVdDAanBj7YqEpPxavoJlTQu0vdvXqTaBLRXt
 ctVK50wSQbs5oVhzHjR3jw06i/PqXkf7L0iO58ViJ8AIq2nEIz7Q0r4n4/ajcE+CKZXd
 +zz9vRhYTCNmXkPd8SJpxV96jCeOxi6LJlPV8t68kqd9KE/2GYnFuTtoQjFZPk8TQU5B
 6KUBBjwG793v8OacycZuDEaNVU8UFhb9pSN+ofhVx+vb+sYPqfgRfVj/LVixbmF9F4X1
 Slgw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772210831; x=1772815631;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BKQzT9t7ZI3mb+6EDIKBTxaX0DX68JkIAcPYLBp08+M=;
 b=rU5mlzcj05NT//UPSpojV4oaVKdHl8wscllZCBlv4eNpAV/Ar1IDPonwOqfLflIq2r
 6BOAHjEA9uEp1bxwfp7U8hP1phr6bqIfsUI0OllVHfzvWfCCQ/qe7Qlz7oS9Ti9Kpg4o
 tJZ8jmiy5LWPlOWaWBQpBDd9VcIQr+KE20O2Yl3qFBirZGgd0f2A1gckiLb4iTtfN59h
 4c1J8Mp+sMuGpkzDMSrrHjKFKmILolyn69PmaqMEtXpnHTaa0oXp/e0oqWfA7JRp1lfr
 O4JWcrV+Lf9IQbDMRztxDDcTKqmfiFi4jB+lVtn1H6NZNbYaVtIz1/IHgbfHlMm5bCtb
 s5nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYsdvAafxHXZjmEieFQoS3znhUdxTlAD9SDvCdmx9AUAxVgXx4acW257YPC0JxWBYNCqo0qfuU26GR535pLb4N@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyaIW42EBY+vlhNEN3az0cN/mEoC+8N5zVST4ddoI1fRPS0I64u
 4azTimtgPrwN59xzJJZHbUWAZKCIYEs90q/q/stIuny/YJYzVghpS9AOE7mUT9+3pZgH98Cdslp
 PnuWudnOWwGybImpJPu5GRXG7HcRz6YbAGKMnGUD6G0qze5rOpeMrgMZbTS0AW1g6HUhFS+KaPi
 Uv5O0JKRgV3+uvZYzbHYmlKCPL+vDuuAa0gXJQPo3bRPfiTrDfWH6/qa1k3ftqgAjNM3SQbg==
X-Gm-Gg: ATEYQzwonRK8pQf1S1jGc5rnIP0JiKVXy4oCb2mhFmcAL+3sKUzj0Ekn+1rp21CfcAi
 1r5/hj9RaKEl94tG2JmmuiKGbzk0sQ90LkqnUeBVD5ntcwb9UubCb7u3BH/0Z8WsBxoD4KHrctH
 Sg4swBzaKV/Y9MJum/Bzhs4s9vi6E+yVYoq8LJaikF/qlo6OG1zELS/KqxeIfxYeHN12Ze8Ce6I
 DVUbB00FDGsp3IYvNFZCsjAGVsmFt2vhIRiACw7Xzhx3VOym+nG5kBn6fntP/nKGZM=
X-Received: by 2002:a53:b743:0:b0:64c:9b84:92ee with SMTP id
 956f58d0204a3-64cb6f438a9mr3821236d50.31.1772210830763; 
 Fri, 27 Feb 2026 08:47:10 -0800 (PST)
X-Received: by 2002:a53:b743:0:b0:64c:9b84:92ee with SMTP id
 956f58d0204a3-64cb6f438a9mr3821130d50.31.1772210830102; Fri, 27 Feb 2026
 08:47:10 -0800 (PST)
MIME-Version: 1.0
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
 <20260226-iino-u64-v1-51-ccceff366db9@kernel.org>
In-Reply-To: <20260226-iino-u64-v1-51-ccceff366db9@kernel.org>
Date: Fri, 27 Feb 2026 08:46:58 -0800
X-Gm-Features: AaiRm50sr0j0-BwzNnmwGRvH8jyB1wNkHgZo3vdp3K_4YIT1mBOH-BzuS2c5S3A
Message-ID: <CAKCV-6ujQK3yj8sB2eHafaw4pvrJUeK18Hu4vzvNSjH48RVgYg@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Feb 26,
 2026 at 9:13 AM Jeff Layton <jlayton@kernel.org>
 wrote: > > Update %lu/%ld to %llu/%lld in security audit logging functions
 that > print inode->i_ino, since i_ino is now u64. > > Files [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [185.125.188.123 listed in list.dnswl.org]
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vw1Gl-0007x4-Eo
Subject: Re: [f2fs-dev] [PATCH 51/61] security: update audit format strings
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
From: Ryan Lee via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Ryan Lee <ryan.lee@canonical.com>
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.01 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jlayton@kernel.org,m:lucho@ionkov.net,m:nvdimm@lists.linux.dev,m:pc@manguebit.org,m:djwong@kernel.org,m:al@alarsen.net,m:dri-devel@lists.freedesktop.org,m:linux-hams@vger.kernel.org,m:sumit.semwal@linaro.org,m:hubcap@omnibond.com,m:linux-xfs@vger.kernel.org,m:wufan@kernel.org,m:ceph-devel@vger.kernel.org,m:jmorris@namei.org,m:code@tyhicks.com,m:hch@infradead.org,m:devel@lists.orangefs.org,m:sprasad@microsoft.com,m:ms@dev.tdt.de,m:jaharkes@cs.cmu.edu,m:willemb@google.com,m:acme@kernel.org,m:linux-fscrypt@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:david@kernel.org,m:ericvh@kernel.org,m:brauner@kernel.org,m:dmitry.kasatkin@gmail.com,m:stephen.smalley.work@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:chuck.lever@oracle.com,m:mhiramat@kernel.org,m:jolsa@kernel.org,m:jack@suse.com,m:alexander.deucher@amd.com,m:linux-media@vger.kernel.org,m:trondmy@kernel.org,m:mark.rutland
 @arm.com,m:shaggy@kernel.org,m:zohar@linux.ibm.com,m:oleg@redhat.com,m:edumazet@google.com,m:simona@ffwll.ch,m:linux-cifs@vger.kernel.org,m:kuniyu@google.com,m:linux-nilfs@vger.kernel.org,m:paul@paul-moore.com,m:codalist@coda.cs.cmu.edu,m:linux-trace-kernel@vger.kernel.org,m:okorniev@redhat.com,m:frank.li@vivo.com,m:selinux@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:casey@schaufler-ca.com,m:netfs@lists.linux.dev,m:jaegeuk@kernel.org,m:fsverity@lists.linux.dev,m:tytso@mit.edu,m:nico@fluxnic.net,m:muchun.song@linux.dev,m:roberto.sassu@huawei.com,m:davem@davemloft.net,m:anna@kernel.org,m:linux-integrity@vger.kernel.org,m:amarkuze@redhat.com,m:martin@omnibond.com,m:alexander.shishkin@linux.intel.com,m:ocfs2-devel@lists.linux.dev,m:jfs-discussion@lists.sourceforge.net,m:linux-mtd@lists.infradead.org,m:amd-gfx@lists.freedesktop.org,m:marc.dionne@auristor.com,m:linux-afs@lists.infradead.org,m:raven@themaw.net,m:naohiro.aota@wdc.com,m:ebiggers@kernel.org,m:miklos@szeredi.hu,m:willy@
 infradead.org,m:coda@cs.cmu.edu,m:slava@dubeyko.com,m:neil@brown.name,m:idryomov@gmail.com,m:pabeni@redhat.com,m:serge@hallyn.com,m:amir73il@gmail.com,m:james.clark@linaro.org,m:autofs@vger.kernel.org,m:rostedt@goodmis.org,m:dlemoal@kernel.org,m:mathieu.desnoyers@efficios.com,m:dan.j.williams@intel.com,m:osalvador@suse.de,m:almaz.alexandrovich@paragon-software.com,m:linux-nfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,canonical.com:s=20251003];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,canonical.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCPT_COUNT_GT_50(0.00)[144];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[ionkov.net,lists.linux.dev,manguebit.org,kernel.org,alarsen.net,lists.freedesktop.org,vger.kernel.org,linaro.org,omnibond.com,namei.org,tyhicks.com,infradead.org,lists.orangefs.org,microsoft.com,dev.tdt.de,cs.cmu.edu,google.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,oracle.com,suse.com,amd.com,arm.com,linux.ibm.com,redhat.com,ffwll.ch,paul-moore.com,coda.cs.cmu.edu,vivo.com,lists.linaro.org,schaufler-ca.com,mit.edu,fluxnic.net,linux.dev,huawei.com,davemloft.net,linux.intel.com,lists.sourceforge.net,lists.infradead.org,auristor.com,themaw.net,wdc.com,szeredi.hu,dubeyko.com,brown.name,hallyn.com,goodmis.org,efficios.com,intel.com,suse.de,paragon-software.com,kvack.org,lists.samba.org,samba.org,suse.cz,codewreck.org,crudebyte.com,linux.alibaba.com,dilger.ca,artax.karlin.mff.cuni.cz,nod.at,fasheh.com,lists.ubuntu.com,talpey.com,canonical.com,evilplan.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[ryan.lee@canonical.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,canonical.com:replyto,canonical.com:email]
X-Rspamd-Queue-Id: 4C7501BB2D1
X-Rspamd-Action: no action

T24gVGh1LCBGZWIgMjYsIDIwMjYgYXQgOToxM+KAr0FNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gVXBkYXRlICVsdS8lbGQgdG8gJWxsdS8lbGxkIGluIHNlY3Vy
aXR5IGF1ZGl0IGxvZ2dpbmcgZnVuY3Rpb25zIHRoYXQKPiBwcmludCBpbm9kZS0+aV9pbm8sIHNp
bmNlIGlfaW5vIGlzIG5vdyB1NjQuCj4KPiBGaWxlcyB1cGRhdGVkOiBhcHBhcm1vci9hcHBhcm1v
cmZzLmMsIGludGVncml0eS9pbnRlZ3JpdHlfYXVkaXQuYywKPiBpcGUvYXVkaXQuYywgbHNtX2F1
ZGl0LmMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3Jn
Pgo+IC0tLQo+ICBzZWN1cml0eS9hcHBhcm1vci9hcHBhcm1vcmZzLmMgICAgICAgfCAgNCArKy0t
Cj4gIHNlY3VyaXR5L2ludGVncml0eS9pbnRlZ3JpdHlfYXVkaXQuYyB8ICAyICstCj4gIHNlY3Vy
aXR5L2lwZS9hdWRpdC5jICAgICAgICAgICAgICAgICB8ICAyICstCj4gIHNlY3VyaXR5L2xzbV9h
dWRpdC5jICAgICAgICAgICAgICAgICB8IDEwICsrKysrLS0tLS0KPiAgc2VjdXJpdHkvc2VsaW51
eC9ob29rcy5jICAgICAgICAgICAgIHwgIDQgKystLQo+ICBzZWN1cml0eS9zbWFjay9zbWFja19s
c20uYyAgICAgICAgICAgfCAxMiArKysrKystLS0tLS0KPiAgNiBmaWxlcyBjaGFuZ2VkLCAxNyBp
bnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9zZWN1cml0eS9h
cHBhcm1vci9hcHBhcm1vcmZzLmMgYi9zZWN1cml0eS9hcHBhcm1vci9hcHBhcm1vcmZzLmMKPiBp
bmRleCAyZjg0YmQyM2VkYjY5ZTdlNjljYjA5N2U1NTQwOTFkZjAxMzI4MTZkLi43YjY0NWY0MGU3
MWM5NTZmMjE2ZmE2YTdkNjljM2VjZDRlMmE1ZmY0IDEwMDY0NAo+IC0tLSBhL3NlY3VyaXR5L2Fw
cGFybW9yL2FwcGFybW9yZnMuYwo+ICsrKyBiL3NlY3VyaXR5L2FwcGFybW9yL2FwcGFybW9yZnMu
Ywo+IEBAIC0xNDksNyArMTQ5LDcgQEAgc3RhdGljIGludCBhYWZzX2NvdW50Owo+Cj4gIHN0YXRp
YyBpbnQgYWFmc19zaG93X3BhdGgoc3RydWN0IHNlcV9maWxlICpzZXEsIHN0cnVjdCBkZW50cnkg
KmRlbnRyeSkKPiAgewo+IC0gICAgICAgc2VxX3ByaW50ZihzZXEsICIlczpbJWx1XSIsIEFBRlNf
TkFNRSwgZF9pbm9kZShkZW50cnkpLT5pX2lubyk7Cj4gKyAgICAgICBzZXFfcHJpbnRmKHNlcSwg
IiVzOlslbGx1XSIsIEFBRlNfTkFNRSwgZF9pbm9kZShkZW50cnkpLT5pX2lubyk7Cj4gICAgICAg
ICByZXR1cm4gMDsKPiAgfQo+Cj4gQEAgLTI2NDQsNyArMjY0NCw3IEBAIHN0YXRpYyBpbnQgcG9s
aWN5X3JlYWRsaW5rKHN0cnVjdCBkZW50cnkgKmRlbnRyeSwgY2hhciBfX3VzZXIgKmJ1ZmZlciwK
PiAgICAgICAgIGNoYXIgbmFtZVszMl07CgpJIGhhdmUgY29uZmlybWVkIHRoYXQgdGhlIGJ1ZmZl
ciBpcyBzdGlsbCBiaWcgZW5vdWdoIGZvciBhIDY0LWJpdCBpbm9kZSBudW1iZXIuCgo+ICAgICAg
ICAgaW50IHJlczsKPgo+IC0gICAgICAgcmVzID0gc25wcmludGYobmFtZSwgc2l6ZW9mKG5hbWUp
LCAiJXM6WyVsdV0iLCBBQUZTX05BTUUsCj4gKyAgICAgICByZXMgPSBzbnByaW50ZihuYW1lLCBz
aXplb2YobmFtZSksICIlczpbJWxsdV0iLCBBQUZTX05BTUUsCj4gICAgICAgICAgICAgICAgICAg
ICAgICBkX2lub2RlKGRlbnRyeSktPmlfaW5vKTsKPiAgICAgICAgIGlmIChyZXMgPiAwICYmIHJl
cyA8IHNpemVvZihuYW1lKSkKPiAgICAgICAgICAgICAgICAgcmVzID0gcmVhZGxpbmtfY29weShi
dWZmZXIsIGJ1ZmxlbiwgbmFtZSwgc3RybGVuKG5hbWUpKTsKCkZvciB0aGUgQXBwQXJtb3IgcG9y
dGlvbjoKClJldmlld2VkLUJ5OiBSeWFuIExlZSA8cnlhbi5sZWVAY2Fub25pY2FsLmNvbT4KCj4g
ZGlmZiAtLWdpdCBhL3NlY3VyaXR5L2ludGVncml0eS9pbnRlZ3JpdHlfYXVkaXQuYyBiL3NlY3Vy
aXR5L2ludGVncml0eS9pbnRlZ3JpdHlfYXVkaXQuYwo+IGluZGV4IDBlYzVlNGMyMmNiMmExMDY2
YzJiODk3Nzc2ZWFkNmQzZGI3MjYzNWMuLmQ4ZDllNWZmMWNkMjJiMDkxZjQ2MmQxZTgzZDI4ZDJk
NmJkOTgzZTkgMTAwNjQ0Cj4gLS0tIGEvc2VjdXJpdHkvaW50ZWdyaXR5L2ludGVncml0eV9hdWRp
dC5jCj4gKysrIGIvc2VjdXJpdHkvaW50ZWdyaXR5L2ludGVncml0eV9hdWRpdC5jCj4gQEAgLTYy
LDcgKzYyLDcgQEAgdm9pZCBpbnRlZ3JpdHlfYXVkaXRfbWVzc2FnZShpbnQgYXVkaXRfbXNnbm8s
IHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4gICAgICAgICBpZiAoaW5vZGUpIHsKPiAgICAgICAgICAg
ICAgICAgYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiBkZXY9Iik7Cj4gICAgICAgICAgICAgICAgIGF1
ZGl0X2xvZ191bnRydXN0ZWRzdHJpbmcoYWIsIGlub2RlLT5pX3NiLT5zX2lkKTsKPiAtICAgICAg
ICAgICAgICAgYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiBpbm89JWx1IiwgaW5vZGUtPmlfaW5vKTsK
PiArICAgICAgICAgICAgICAgYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiBpbm89JWxsdSIsIGlub2Rl
LT5pX2lubyk7Cj4gICAgICAgICB9Cj4gICAgICAgICBhdWRpdF9sb2dfZm9ybWF0KGFiLCAiIHJl
cz0lZCBlcnJubz0lZCIsICFyZXN1bHQsIGVycm5vKTsKPiAgICAgICAgIGF1ZGl0X2xvZ19lbmQo
YWIpOwo+IGRpZmYgLS1naXQgYS9zZWN1cml0eS9pcGUvYXVkaXQuYyBiL3NlY3VyaXR5L2lwZS9h
dWRpdC5jCj4gaW5kZXggM2YwZGVlYjU0OTEyNzMwZDlhY2Y1ZTAyMWE0YTBjYjI5YTM0ZTk4Mi4u
OTNmYjU5ZmJkZGQ2MGI1NmMwYjIyYmUyYTM4YjgwOWVmOWUxOGI3NiAxMDA2NDQKPiAtLS0gYS9z
ZWN1cml0eS9pcGUvYXVkaXQuYwo+ICsrKyBiL3NlY3VyaXR5L2lwZS9hdWRpdC5jCj4gQEAgLTE1
Myw3ICsxNTMsNyBAQCB2b2lkIGlwZV9hdWRpdF9tYXRjaChjb25zdCBzdHJ1Y3QgaXBlX2V2YWxf
Y3R4ICpjb25zdCBjdHgsCj4gICAgICAgICAgICAgICAgIGlmIChpbm9kZSkgewo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGF1ZGl0X2xvZ19mb3JtYXQoYWIsICIgZGV2PSIpOwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGF1ZGl0X2xvZ191bnRydXN0ZWRzdHJpbmcoYWIsIGlub2RlLT5pX3Ni
LT5zX2lkKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICBhdWRpdF9sb2dfZm9ybWF0KGFiLCAi
IGlubz0lbHUiLCBpbm9kZS0+aV9pbm8pOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGF1ZGl0
X2xvZ19mb3JtYXQoYWIsICIgaW5vPSVsbHUiLCBpbm9kZS0+aV9pbm8pOwo+ICAgICAgICAgICAg
ICAgICB9IGVsc2Ugewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGF1ZGl0X2xvZ19mb3JtYXQo
YWIsICIgZGV2PT8gaW5vPT8iKTsKPiAgICAgICAgICAgICAgICAgfQo+IGRpZmYgLS1naXQgYS9z
ZWN1cml0eS9sc21fYXVkaXQuYyBiL3NlY3VyaXR5L2xzbV9hdWRpdC5jCj4gaW5kZXggN2Q2MjNi
MDA0OTVjMTRiMDc5ZTEwZTk2M2MyMWE5Zjk0OWMxMWYwNy4uNzM3ZjVhMjYzYThmNzk0MTYxMzMz
MTVlZGYzNjNlY2UzZDc5YzcyMiAxMDA2NDQKPiAtLS0gYS9zZWN1cml0eS9sc21fYXVkaXQuYwo+
ICsrKyBiL3NlY3VyaXR5L2xzbV9hdWRpdC5jCj4gQEAgLTIwMiw3ICsyMDIsNyBAQCB2b2lkIGF1
ZGl0X2xvZ19sc21fZGF0YShzdHJ1Y3QgYXVkaXRfYnVmZmVyICphYiwKPiAgICAgICAgICAgICAg
ICAgaWYgKGlub2RlKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgYXVkaXRfbG9nX2Zvcm1h
dChhYiwgIiBkZXY9Iik7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgYXVkaXRfbG9nX3VudHJ1
c3RlZHN0cmluZyhhYiwgaW5vZGUtPmlfc2ItPnNfaWQpOwo+IC0gICAgICAgICAgICAgICAgICAg
ICAgIGF1ZGl0X2xvZ19mb3JtYXQoYWIsICIgaW5vPSVsdSIsIGlub2RlLT5pX2lubyk7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiBpbm89JWxsdSIsIGlu
b2RlLT5pX2lubyk7Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgYnJlYWs7
Cj4gICAgICAgICB9Cj4gQEAgLTIxNSw3ICsyMTUsNyBAQCB2b2lkIGF1ZGl0X2xvZ19sc21fZGF0
YShzdHJ1Y3QgYXVkaXRfYnVmZmVyICphYiwKPiAgICAgICAgICAgICAgICAgaWYgKGlub2RlKSB7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiBkZXY9Iik7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgYXVkaXRfbG9nX3VudHJ1c3RlZHN0cmluZyhhYiwg
aW5vZGUtPmlfc2ItPnNfaWQpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIGF1ZGl0X2xvZ19m
b3JtYXQoYWIsICIgaW5vPSVsdSIsIGlub2RlLT5pX2lubyk7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiBpbm89JWxsdSIsIGlub2RlLT5pX2lubyk7Cj4g
ICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICB9Cj4g
QEAgLTIyOCw3ICsyMjgsNyBAQCB2b2lkIGF1ZGl0X2xvZ19sc21fZGF0YShzdHJ1Y3QgYXVkaXRf
YnVmZmVyICphYiwKPiAgICAgICAgICAgICAgICAgaWYgKGlub2RlKSB7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiBkZXY9Iik7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgYXVkaXRfbG9nX3VudHJ1c3RlZHN0cmluZyhhYiwgaW5vZGUtPmlfc2ItPnNf
aWQpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIGF1ZGl0X2xvZ19mb3JtYXQoYWIsICIgaW5v
PSVsdSIsIGlub2RlLT5pX2lubyk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYXVkaXRfbG9n
X2Zvcm1hdChhYiwgIiBpbm89JWxsdSIsIGlub2RlLT5pX2lubyk7Cj4gICAgICAgICAgICAgICAg
IH0KPgo+ICAgICAgICAgICAgICAgICBhdWRpdF9sb2dfZm9ybWF0KGFiLCAiIGlvY3RsY21kPTB4
JWh4IiwgYS0+dS5vcC0+Y21kKTsKPiBAQCAtMjQ2LDcgKzI0Niw3IEBAIHZvaWQgYXVkaXRfbG9n
X2xzbV9kYXRhKHN0cnVjdCBhdWRpdF9idWZmZXIgKmFiLAo+ICAgICAgICAgICAgICAgICBpZiAo
aW5vZGUpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBhdWRpdF9sb2dfZm9ybWF0KGFiLCAi
IGRldj0iKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBhdWRpdF9sb2dfdW50cnVzdGVkc3Ry
aW5nKGFiLCBpbm9kZS0+aV9zYi0+c19pZCk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgYXVk
aXRfbG9nX2Zvcm1hdChhYiwgIiBpbm89JWx1IiwgaW5vZGUtPmlfaW5vKTsKPiArICAgICAgICAg
ICAgICAgICAgICAgICBhdWRpdF9sb2dfZm9ybWF0KGFiLCAiIGlubz0lbGx1IiwgaW5vZGUtPmlf
aW5vKTsKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAg
ICAgIH0KPiBAQCAtMjY1LDcgKzI2NSw3IEBAIHZvaWQgYXVkaXRfbG9nX2xzbV9kYXRhKHN0cnVj
dCBhdWRpdF9idWZmZXIgKmFiLAo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAg
IGF1ZGl0X2xvZ19mb3JtYXQoYWIsICIgZGV2PSIpOwo+ICAgICAgICAgICAgICAgICBhdWRpdF9s
b2dfdW50cnVzdGVkc3RyaW5nKGFiLCBpbm9kZS0+aV9zYi0+c19pZCk7Cj4gLSAgICAgICAgICAg
ICAgIGF1ZGl0X2xvZ19mb3JtYXQoYWIsICIgaW5vPSVsdSIsIGlub2RlLT5pX2lubyk7Cj4gKyAg
ICAgICAgICAgICAgIGF1ZGl0X2xvZ19mb3JtYXQoYWIsICIgaW5vPSVsbHUiLCBpbm9kZS0+aV9p
bm8pOwo+ICAgICAgICAgICAgICAgICByY3VfcmVhZF91bmxvY2soKTsKPiAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gICAgICAgICB9Cj4gZGlmZiAtLWdpdCBhL3NlY3VyaXR5L3NlbGludXgvaG9v
a3MuYyBiL3NlY3VyaXR5L3NlbGludXgvaG9va3MuYwo+IGluZGV4IGQ4MjI0ZWExMTNkMWFjMjcz
YWFjMWZiNTIzMjRmMDBiMzMwMWFlNzUuLjE1MGVhODZlYmMxZjdjN2Y4MzkxYWY0MTA5YTNkYTgy
YjEyZDAwZDIgMTAwNjQ0Cj4gLS0tIGEvc2VjdXJpdHkvc2VsaW51eC9ob29rcy5jCj4gKysrIGIv
c2VjdXJpdHkvc2VsaW51eC9ob29rcy5jCj4gQEAgLTE0MDAsNyArMTQwMCw3IEBAIHN0YXRpYyBp
bnQgaW5vZGVfZG9pbml0X3VzZV94YXR0cihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZGVu
dHJ5ICpkZW50cnksCj4gICAgICAgICBpZiAocmMgPCAwKSB7Cj4gICAgICAgICAgICAgICAgIGtm
cmVlKGNvbnRleHQpOwo+ICAgICAgICAgICAgICAgICBpZiAocmMgIT0gLUVOT0RBVEEpIHsKPiAt
ICAgICAgICAgICAgICAgICAgICAgICBwcl93YXJuKCJTRUxpbnV4OiAlczogIGdldHhhdHRyIHJl
dHVybmVkICVkIGZvciBkZXY9JXMgaW5vPSVsZFxuIiwKPiArICAgICAgICAgICAgICAgICAgICAg
ICBwcl93YXJuKCJTRUxpbnV4OiAlczogIGdldHhhdHRyIHJldHVybmVkICVkIGZvciBkZXY9JXMg
aW5vPSVsbGRcbiIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywg
LXJjLCBpbm9kZS0+aV9zYi0+c19pZCwgaW5vZGUtPmlfaW5vKTsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gcmM7Cj4gICAgICAgICAgICAgICAgIH0KPiBAQCAtMzQ3Nyw3ICszNDc3
LDcgQEAgc3RhdGljIHZvaWQgc2VsaW51eF9pbm9kZV9wb3N0X3NldHhhdHRyKHN0cnVjdCBkZW50
cnkgKmRlbnRyeSwgY29uc3QgY2hhciAqbmFtZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgJm5ld3NpZCk7Cj4gICAgICAgICBpZiAocmMpIHsKPiAgICAgICAg
ICAgICAgICAgcHJfZXJyKCJTRUxpbnV4OiAgdW5hYmxlIHRvIG1hcCBjb250ZXh0IHRvIFNJRCIK
PiAtICAgICAgICAgICAgICAgICAgICAgICJmb3IgKCVzLCAlbHUpLCByYz0lZFxuIiwKPiArICAg
ICAgICAgICAgICAgICAgICAgICJmb3IgKCVzLCAlbGx1KSwgcmM9JWRcbiIsCj4gICAgICAgICAg
ICAgICAgICAgICAgICBpbm9kZS0+aV9zYi0+c19pZCwgaW5vZGUtPmlfaW5vLCAtcmMpOwo+ICAg
ICAgICAgICAgICAgICByZXR1cm47Cj4gICAgICAgICB9Cj4gZGlmZiAtLWdpdCBhL3NlY3VyaXR5
L3NtYWNrL3NtYWNrX2xzbS5jIGIvc2VjdXJpdHkvc21hY2svc21hY2tfbHNtLmMKPiBpbmRleCA5
OGFmOWQ3Yjk0MzQ2OWQwZGRkMzQ0ZmM3OGMwYjg3Y2E0MGMxNmM0Li43ZTJmNTRjMTdhNWQ1Yzcw
NzQwYmJmYTkyYmE0ZDRmMWFjYTJjZjIyIDEwMDY0NAo+IC0tLSBhL3NlY3VyaXR5L3NtYWNrL3Nt
YWNrX2xzbS5jCj4gKysrIGIvc2VjdXJpdHkvc21hY2svc21hY2tfbHNtLmMKPiBAQCAtMTgyLDcg
KzE4Miw3IEBAIHN0YXRpYyBpbnQgc21rX2J1X2lub2RlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGlu
dCBtb2RlLCBpbnQgcmMpCj4gICAgICAgICBjaGFyIGFjY1tTTUtfTlVNX0FDQ0VTU19UWVBFICsg
MV07Cj4KPiAgICAgICAgIGlmIChpc3AtPnNta19mbGFncyAmIFNNS19JTk9ERV9JTVBVUkUpCj4g
LSAgICAgICAgICAgICAgIHByX2luZm8oIlNtYWNrIFVuY29uZmluZWQgQ29ycnVwdGlvbjogaW5v
ZGU9KCVzICVsZCkgJXNcbiIsCj4gKyAgICAgICAgICAgICAgIHByX2luZm8oIlNtYWNrIFVuY29u
ZmluZWQgQ29ycnVwdGlvbjogaW5vZGU9KCVzICVsbGQpICVzXG4iLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGlub2RlLT5pX3NiLT5zX2lkLCBpbm9kZS0+aV9pbm8sIGN1cnJlbnQtPmNvbW0p
Owo+Cj4gICAgICAgICBpZiAocmMgPD0gMCkKPiBAQCAtMTk1LDcgKzE5NSw3IEBAIHN0YXRpYyBp
bnQgc21rX2J1X2lub2RlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGludCBtb2RlLCBpbnQgcmMpCj4K
PiAgICAgICAgIHNta19idV9tb2RlKG1vZGUsIGFjYyk7Cj4KPiAtICAgICAgIHByX2luZm8oIlNt
YWNrICVzOiAoJXMgJXMgJXMpIGlub2RlPSglcyAlbGQpICVzXG4iLCBzbWtfYnVfbWVzc1tyY10s
Cj4gKyAgICAgICBwcl9pbmZvKCJTbWFjayAlczogKCVzICVzICVzKSBpbm9kZT0oJXMgJWxsZCkg
JXNcbiIsIHNta19idV9tZXNzW3JjXSwKPiAgICAgICAgICAgICAgICAgdHNwLT5zbWtfdGFzay0+
c21rX2tub3duLCBpc3AtPnNta19pbm9kZS0+c21rX2tub3duLCBhY2MsCj4gICAgICAgICAgICAg
ICAgIGlub2RlLT5pX3NiLT5zX2lkLCBpbm9kZS0+aV9pbm8sIGN1cnJlbnQtPmNvbW0pOwo+ICAg
ICAgICAgcmV0dXJuIDA7Cj4gQEAgLTIxNCw3ICsyMTQsNyBAQCBzdGF0aWMgaW50IHNta19idV9m
aWxlKHN0cnVjdCBmaWxlICpmaWxlLCBpbnQgbW9kZSwgaW50IHJjKQo+ICAgICAgICAgY2hhciBh
Y2NbU01LX05VTV9BQ0NFU1NfVFlQRSArIDFdOwo+Cj4gICAgICAgICBpZiAoaXNwLT5zbWtfZmxh
Z3MgJiBTTUtfSU5PREVfSU1QVVJFKQo+IC0gICAgICAgICAgICAgICBwcl9pbmZvKCJTbWFjayBV
bmNvbmZpbmVkIENvcnJ1cHRpb246IGlub2RlPSglcyAlbGQpICVzXG4iLAo+ICsgICAgICAgICAg
ICAgICBwcl9pbmZvKCJTbWFjayBVbmNvbmZpbmVkIENvcnJ1cHRpb246IGlub2RlPSglcyAlbGxk
KSAlc1xuIiwKPiAgICAgICAgICAgICAgICAgICAgICAgICBpbm9kZS0+aV9zYi0+c19pZCwgaW5v
ZGUtPmlfaW5vLCBjdXJyZW50LT5jb21tKTsKPgo+ICAgICAgICAgaWYgKHJjIDw9IDApCj4gQEAg
LTIyMyw3ICsyMjMsNyBAQCBzdGF0aWMgaW50IHNta19idV9maWxlKHN0cnVjdCBmaWxlICpmaWxl
LCBpbnQgbW9kZSwgaW50IHJjKQo+ICAgICAgICAgICAgICAgICByYyA9IDA7Cj4KPiAgICAgICAg
IHNta19idV9tb2RlKG1vZGUsIGFjYyk7Cj4gLSAgICAgICBwcl9pbmZvKCJTbWFjayAlczogKCVz
ICVzICVzKSBmaWxlPSglcyAlbGQgJXBEKSAlc1xuIiwgc21rX2J1X21lc3NbcmNdLAo+ICsgICAg
ICAgcHJfaW5mbygiU21hY2sgJXM6ICglcyAlcyAlcykgZmlsZT0oJXMgJWxsZCAlcEQpICVzXG4i
LCBzbWtfYnVfbWVzc1tyY10sCj4gICAgICAgICAgICAgICAgIHNza3AtPnNta19rbm93biwgc21r
X29mX2lub2RlKGlub2RlKS0+c21rX2tub3duLCBhY2MsCj4gICAgICAgICAgICAgICAgIGlub2Rl
LT5pX3NiLT5zX2lkLCBpbm9kZS0+aV9pbm8sIGZpbGUsCj4gICAgICAgICAgICAgICAgIGN1cnJl
bnQtPmNvbW0pOwo+IEBAIC0yNDQsNyArMjQ0LDcgQEAgc3RhdGljIGludCBzbWtfYnVfY3JlZGZp
bGUoY29uc3Qgc3RydWN0IGNyZWQgKmNyZWQsIHN0cnVjdCBmaWxlICpmaWxlLAo+ICAgICAgICAg
Y2hhciBhY2NbU01LX05VTV9BQ0NFU1NfVFlQRSArIDFdOwo+Cj4gICAgICAgICBpZiAoaXNwLT5z
bWtfZmxhZ3MgJiBTTUtfSU5PREVfSU1QVVJFKQo+IC0gICAgICAgICAgICAgICBwcl9pbmZvKCJT
bWFjayBVbmNvbmZpbmVkIENvcnJ1cHRpb246IGlub2RlPSglcyAlbGQpICVzXG4iLAo+ICsgICAg
ICAgICAgICAgICBwcl9pbmZvKCJTbWFjayBVbmNvbmZpbmVkIENvcnJ1cHRpb246IGlub2RlPSgl
cyAlbGxkKSAlc1xuIiwKPiAgICAgICAgICAgICAgICAgICAgICAgICBpbm9kZS0+aV9zYi0+c19p
ZCwgaW5vZGUtPmlfaW5vLCBjdXJyZW50LT5jb21tKTsKPgo+ICAgICAgICAgaWYgKHJjIDw9IDAp
Cj4gQEAgLTI1Myw3ICsyNTMsNyBAQCBzdGF0aWMgaW50IHNta19idV9jcmVkZmlsZShjb25zdCBz
dHJ1Y3QgY3JlZCAqY3JlZCwgc3RydWN0IGZpbGUgKmZpbGUsCj4gICAgICAgICAgICAgICAgIHJj
ID0gMDsKPgo+ICAgICAgICAgc21rX2J1X21vZGUobW9kZSwgYWNjKTsKPiAtICAgICAgIHByX2lu
Zm8oIlNtYWNrICVzOiAoJXMgJXMgJXMpIGZpbGU9KCVzICVsZCAlcEQpICVzXG4iLCBzbWtfYnVf
bWVzc1tyY10sCj4gKyAgICAgICBwcl9pbmZvKCJTbWFjayAlczogKCVzICVzICVzKSBmaWxlPSgl
cyAlbGxkICVwRCkgJXNcbiIsIHNta19idV9tZXNzW3JjXSwKPiAgICAgICAgICAgICAgICAgc3Nr
cC0+c21rX2tub3duLCBzbWtfb2ZfaW5vZGUoaW5vZGUpLT5zbWtfa25vd24sIGFjYywKPiAgICAg
ICAgICAgICAgICAgaW5vZGUtPmlfc2ItPnNfaWQsIGlub2RlLT5pX2lubywgZmlsZSwKPiAgICAg
ICAgICAgICAgICAgY3VycmVudC0+Y29tbSk7Cj4KPiAtLQo+IDIuNTMuMAo+Cj4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
