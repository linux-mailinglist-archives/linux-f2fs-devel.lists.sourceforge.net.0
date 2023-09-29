Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CB17B2ACE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Sep 2023 05:50:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qm4WT-0002gR-Oa;
	Fri, 29 Sep 2023 03:50:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1qm4WQ-0002gC-88;
 Fri, 29 Sep 2023 03:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LYYbHmRBUQu7YjfKhJdocL7dPfjriCkGg2JwzJsWdwM=; b=Jv+IP+Rg1dsq0SbVhXWDnMjAnh
 1idCCzQO/CEGyQJA9v1petQtSQr+obB1tTlT+5ewGZrmN+0ZnuyKw+jUKnrK/mPZFKMMupqeVTgpj
 YxUh8a3HYbhc+J9igB0rrC2LDKrE0L2ZHS/M8wMeyEbqmauN72H1ClH0pWTd0MvjvguY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LYYbHmRBUQu7YjfKhJdocL7dPfjriCkGg2JwzJsWdwM=; b=UPfoudb+Nzu7RL1WNli9YK9T7Q
 F/UWXFhcC1K02sfNQEZM3ZhtDamnKQzcZ55j0W7ALn5Eb8Rvw/bvnlNwFgOsCrEQ03N+YhsHPPHNr
 35Pw8liKd/vpPQLC3+pwqvC7UB0NHUuZ24JhJ8yijr2BhRIP6tzvXgW6gIiLnyiseFbM=;
Received: from mail-qk1-f176.google.com ([209.85.222.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qm4WM-0008Vf-P1; Fri, 29 Sep 2023 03:50:32 +0000
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7741c5bac51so767066585a.1; 
 Thu, 28 Sep 2023 20:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695959425; x=1696564225; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LYYbHmRBUQu7YjfKhJdocL7dPfjriCkGg2JwzJsWdwM=;
 b=CC3GM3RZgZz5Z6TbZQSzMHQlE54m1FGVwRpGQXp9b9JkTdQ7N/zWqlsZkvrCEGjLsR
 Q1LYjskJCe2Zj8mn6ud85Cl74Nb2b2lh+faw4i07OFzefZRRQ/R7J/5MpMM2841Latgy
 QGOXMU1I9Nu9DnXtDicbG17F9TkJm4SXCE7RcPIaloDLoJZ7wjLyBioP5FBeiC1kaUqF
 pMqpIUmcxLMy3I5VpFr1v9eZdIWzr1QDtdfjbwGIDzgDky+e80FCIm8GWTg2I4T5xTi7
 d6tzBpuxVfzMuF4ts5/xsAGV4d9802ABDUknjFT207djgLCPh2f40NxOyPm/lDQYnUJ2
 hP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695959425; x=1696564225;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LYYbHmRBUQu7YjfKhJdocL7dPfjriCkGg2JwzJsWdwM=;
 b=i7qUzBCt74sK0nHwIheSr5eKmlBDENEODfES4DsOIgTOKeWvcDbii993vamFq17yHH
 tkdgW5p0cm0Ex2TVztcpO1GhzfPS1nW3iI3CUbkJ+/lZqovwrF+JrTMuYa5hhVaKTRA2
 QfeC+1vMWgiKgjTWGAgT2DnogSLW9qjkdHmlfkUuQNqhk3L8J6D0+bcpkJaUlLG8Fwlq
 +F3Oq30M27Xhdqpg9rlzNOiFgbRIqRNv43QTJ+JX0nqgc7lL6iIgBV8mElg3WdNi5WKX
 prxoWBCi6TDhQ3gbW7M6l8XkzrL2hNUExSHjM6QH2M7CSf/LdQez92UY5khKQttRmYtf
 apAQ==
X-Gm-Message-State: AOJu0Yx9SVuZmSid0T3uwm1j8gaVx7FpM9pkgGM2XbjS1I64zgR+N6Mn
 dZJku7zQLXRt/cBN5PjlnITDlWK3pc8+/Kv2T9U=
X-Google-Smtp-Source: AGHT+IGZ9FbyCI7u8iOe4evpIjYBqumu0LCfPbLB14Vob7h48kUS/cZM9tDSVc21MSgdNbX4O2KSgM/HSLf/cSOdPJI=
X-Received: by 2002:a05:620a:45a8:b0:774:1875:edb1 with SMTP id
 bp40-20020a05620a45a800b007741875edb1mr3147718qkb.20.1695959424913; Thu, 28
 Sep 2023 20:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230928110554.34758-1-jlayton@kernel.org>
 <20230928110554.34758-2-jlayton@kernel.org>
 <6020d6e7-b187-4abb-bf38-dc09d8bd0f6d@app.fastmail.com>
 <af047e4a1c6947c59d4a13d4ae221c784a5386b4.camel@kernel.org>
 <20230928171943.GK11439@frogsfrogsfrogs>
 <6a6f37d16b55a3003af3f3dbb7778a367f68cd8d.camel@kernel.org>
 <20230928212656.GC189345@mit.edu>
 <CAHk-=wjTynK9BdGbi+8eShU77nkPvipFwRxEd1TSBrw2+LiuDg@mail.gmail.com>
In-Reply-To: <CAHk-=wjTynK9BdGbi+8eShU77nkPvipFwRxEd1TSBrw2+LiuDg@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 29 Sep 2023 06:50:13 +0300
Message-ID: <CAOQ4uxg5ctY9yCjLOjN1nETAcEuNb2UERnYuDv7PoErdxX=WUw@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Sep 29, 2023 at 3:19 AM Linus Torvalds wrote: ...
    > So yes, real programs to cache stat information, and it matters for performance.
    > > But I don't think any actual reasonable program wil [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.176 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.176 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [amir73il[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1qm4WM-0008Vf-P1
Subject: Re: [f2fs-dev] [PATCH 86/87] fs: switch timespec64 fields in inode
 to discrete integers
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, Anders Larsen <al@alarsen.net>,
 Carlos Llamas <cmllamas@google.com>, Andrii Nakryiko <andrii@kernel.org>,
 Mattia Dongili <malattia@linux.it>, Hugh Dickins <hughd@google.com>,
 Yonghong Song <yonghong.song@linux.dev>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 linux-xfs@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 James Morris <jmorris@namei.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Christoph Hellwig <hch@infradead.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, linux-um@lists.infradead.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anton Altaparmakov <anton@tuxera.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Chuck Lever <chuck.lever@oracle.com>, Sven Schnelle <svens@linux.ibm.com>,
 Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-trace-kernel@vger.kernel.org, Dave Kleikamp <shaggy@kernel.org>,
 samba-technical@lists.samba.org, linux-mm@kvack.org,
 Joel Fernandes <joel@joelfernandes.org>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@google.com>, codalist@telemann.coda.cs.cmu.edu,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, Leon Romanovsky <leon@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Todd Kjos <tkjos@android.com>, Vasily Gorbik <gor@linux.ibm.com>,
 selinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 John Johansen <john.johansen@canonical.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Martijn Coenen <maco@android.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net,
 Muchun Song <muchun.song@linux.dev>, linux-f2fs-devel@lists.sourceforge.net,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, gfs2@lists.linux.dev,
 "Eric W. Biederman" <ebiederm@xmission.com>, Anna Schumaker <anna@kernel.org>,
 Brad Warrum <bwarrum@linux.ibm.com>, Mike Kravetz <mike.kravetz@oracle.com>,
 linux-efi@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>,
 ocfs2-devel@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
 Yue Hu <huyue2@gl0jj8bn.sched.sma.tdnsstic1.cn>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 Marc Dionne <marc.dionne@auristor.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-afs@lists.infradead.org, Ian Kent <raven@themaw.net>,
 Naohiro Aota <naohiro.aota@wdc.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, coda@cs.cmu.edu,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, autofs@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Mark Gross <markgross@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, Eric Paris <eparis@parisplace.org>,
 ceph-devel@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-nfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>,
 Song Liu <song@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Steve French <sfrench@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Netdev <netdev@vger.kernel.org>, Bob Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Chandan Babu R <chandan.babu@oracle.com>, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, Neil Brown <neilb@suse.de>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>, KP Singh <kpsingh@kernel.org>,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Salah Triki <salah.triki@gmail.com>,
 platform-driver-x86@vger.kernel.org, Evgeniy Dushistov <dushistov@mail.ru>,
 linux-cifs@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 apparmor@lists.ubuntu.com, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, Hans de Goede <hdegoede@redhat.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Johannes Thumshirn <jth@kernel.org>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, v9fs@lists.linux.dev,
 David Sterba <dsterba@suse.cz>, linux-security-module@vger.kernel.org,
 Jeffle Xu <jefflexu@linux.alibaba.com>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Johannes Berg <johannes@sipsolutions.net>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBTZXAgMjksIDIwMjMgYXQgMzoxOeKAr0FNIExpbnVzIFRvcnZhbGRzCjx0b3J2YWxk
c0BsaW51eC1mb3VuZGF0aW9uLm9yZz4gd3JvdGU6Ci4uLgo+IFNvIHllcywgcmVhbCBwcm9ncmFt
cyB0byBjYWNoZSBzdGF0IGluZm9ybWF0aW9uLCBhbmQgaXQgbWF0dGVycyBmb3IgcGVyZm9ybWFu
Y2UuCj4KPiBCdXQgSSBkb24ndCB0aGluayBhbnkgYWN0dWFsIHJlYXNvbmFibGUgcHJvZ3JhbSB3
aWxsIGhhdmUKPiAqY29ycmVjdG5lc3MqIGlzc3VlcywgdGhvdWdoIC0KCkkgYmVnIHRvIGRpc2Fn
cmVlLgoKPiBiZWNhdXNlIHRoZXJlIGFyZSBjZXJ0YWlubHkgZmlsZXN5c3RlbXMKPiBvdXQgdGhl
cmUgdGhhdCBkb24ndCBkbyBuYW5vc2Vjb25kIHJlc29sdXRpb24gKGFuZCBvdGhlciBvcGVyYXRp
b25zCj4gbGlrZSBjb3B5aW5nIHRyZWVzIGFyb3VuZCB3aWxsIG9idmlvdXNseSBhbHNvIGNoYW5n
ZSB0aW1lcykuCj4KPiBBbnlib2R5IGRvaW5nIHN0ZWdhbm9ncmFwaHkgaW4gdGhlIHRpbWVzdGFt
cHMgaXMgYWxyZWFkeSBub3QgZ29pbmcgdG8KPiBoYXZlIGEgZ3JlYXQgdGltZSwgcmVhbGx5Lgo+
CgpZb3VyIHRoZXNpcyBpbXBsaWVzIHRoYXQgYWxsIGFwcGxpY2F0aW9ucyBhcmUgcG9ydGFibGUg
YWNyb3NzIGRpZmZlcmVudApmaWxlc3lzdGVtcyBhbmQgYWxsIGFwcGxpY2F0aW9ucyBhcmUgZXhw
ZWN0ZWQgdG8gY29wZSB3aXRoIGNvcHlpbmcKdHJlZXMgYXJvdW5kLgoKVGhlcmUgYXJlIGFwcGxp
Y2F0aW9ucyB0aGF0IHdvcmsgb24gc3BlY2lmaWMgZmlsZXN5c3RlbXMgYW5kIHRob3NlCmFwcGxp
Y2F0aW9ucyBhcmUgdmVyeSBtdWNoIHdpdGhpbiBzYW5pdHkgaWYgdGhleSBleHBlY3QgdGhhdCBw
YXN0Cm9ic2VydmVkIHZhbHVlcyBvZiBuc2VjIHdpbGwgbm90IHRvIGNoYW5nZSBpZiB0aGUgZmls
ZSB3YXMgbm90IGNoYW5nZWQuCgpCdXQgZXZlbiBpZiB3ZSBhZ3JlZSB0aGF0IHdpbGwgIm9ubHki
IGh1cnQgcGVyZm9ybWFuY2UsIHlvdXIgZXhhbXBsZSBvZgpwZXJmb3JtYW5jZSBoaXQgKDEwcyBv
ZiBnaXQgZGlmZikgaXMgbm93aGVyZSBjbG9zZSB0byB0aGUgcGVyZm9ybWFuY2UKaGl0IG9mIGlu
dmFsaWRhdGluZyB0aGUgbXRpbWUgY2FjaGUgb2YgYmlsbGlvbnMgb2YgZmlsZXMgYXQgb25jZSAo
aS5lLiBhZnRlcgprZXJuZWwgdXBncmFkZSksIHdoaWNoIG1lYW5zIHRoYXQgcnN5bmMtbGlrZSBw
cm9ncmFtcyBuZWVkIHRvCnJlLXJlYWQgYWxsIHRoZSBkYXRhIGZyb20gcmVtb3RlIGxvY2F0aW9u
cy4KCkkgYW0gbm90IHNheWluZyB0aGF0IGZpbGVzeXN0ZW1zIGNhbm5vdCBkZWNpZGUgdG8gKnN0
b3Agc3RvcmluZyBuc2VjCmdyYW51bGFyaXR5KiBmcm9tIHRoaXMgZGF5IGZvcnRoLCBidXQgbGlr
ZSBidHJmcyBwcmUtaGlzdG9yaWMgdGltZXN0YW1wcywKdGhvc2UgZnMgaGF2ZSBhbiBvYmxpZ2F0
aW9uIHRvIHByZXNlcnZlIGV4aXN0aW5nIG1ldGFkYXRhLCB1bmxlc3MKdXNlcnMgb3B0ZWQgdG8g
dGhyb3cgaXQgYXdheS4KCk9UT0gsIGl0IGlzIHBlcmZlY3RseSBmaW5lIGlmIHRoZSB2ZnMgd2Fu
dHMgdG8gc3RvcCBwcm92aWRpbmcgc3ViIDEwMG5zCnNlcnZpY2VzIHRvIGZpbGVzeXN0ZW1zLiBJ
dCdzIGp1c3QgZ29pbmcgdG8gYmUgdGhlIGZzIHByb2JsZW0gYW5kIHRoZQpwcmVzZXJ2ZWQgcHJl
LWhpc3RvcmljL2ZpbmUtZ3JhaW5lZCB0aW1lIG9uIGV4aXN0aW5nIGZpbGVzIHdvdWxkIG9ubHkK
bmVlZCB0byBiZSBwcm92aWRlZCBpbiBnZXRhdHRyKCkuIEl0IGRvZXMgbm90IG5lZWQgdG8gYmUg
aW4gX19pX210aW1lLgoKVGhhbmtzLApBbWlyLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
