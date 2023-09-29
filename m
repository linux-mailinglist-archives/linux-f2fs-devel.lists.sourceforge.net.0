Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 289507B2A9A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Sep 2023 05:28:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qm4BA-0008BY-VX;
	Fri, 29 Sep 2023 03:28:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1qm4B4-0008Ax-02;
 Fri, 29 Sep 2023 03:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IiAb/i1gc98L6SazD4d4ItKm7HOWY4Sc1dUvsARnIt8=; b=kDmotpI8KmK+dN16thAMV/KK0h
 COKCZgJKsOpsDw1Er4pz19YXMq9K99yjdQDGXBg6kO45RtStY4s8xAu/cj1swHZpvATKu8jbuID9I
 w6U40FOPxXjHZp/QVfR10+6T+TqWeYQyL/RmiuF/pRs6PiSVSU3isgmypqxQpIgOzDVo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IiAb/i1gc98L6SazD4d4ItKm7HOWY4Sc1dUvsARnIt8=; b=KlF8X2lH+VOpGmLhSBeZnAp+6s
 ztAgYvmoH9reGzS1EkoUVH2axjdKv/Y+8ujZXHUqw/kUCTzaID5/NX0h9Mj7+tmMbAZt/wp3+je3U
 Rmgg52OlEtKNaMI+qMc04VOv91UovsPBTOolPjrQV4BdgUROKWzbQ+jr2IpoOixAfLH0=;
Received: from mail-ua1-f45.google.com ([209.85.222.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qm4Au-0007s9-Ow; Fri, 29 Sep 2023 03:28:26 +0000
Received: by mail-ua1-f45.google.com with SMTP id
 a1e0cc1a2514c-79df12ff0f0so5164968241.3; 
 Thu, 28 Sep 2023 20:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695958089; x=1696562889; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IiAb/i1gc98L6SazD4d4ItKm7HOWY4Sc1dUvsARnIt8=;
 b=RbmwHV8d2JFLsOYEWUuLNrxmiWWsvHQ0UxU43hUbhJeFbyptUHxrJEaqCgRLQ2TpYe
 w+uEJrdF9zjjj3jxg6cwIPbrbSiYnypN3PqqdCqjYy36cVI+LOHLLqHxpYdHXm/s6xq2
 1lmd2qFjr7fjt7WC0lXhPZZSLy+eWbzrWI6R7YavFLMkM0I7JtzcwkntBBcKSFgK+268
 zb1ErxjhaQc19rDTaNiizcSMlyGe+rHyTGv/LpemFC8dYwpeQbv7PIRPWm9iY4qQM3i4
 KNVWncR4EYyxcwrahby6lPpSBhkP263zC5mEiNrn1aO+4VUHpPCkiCwrsv4LcK/FCd37
 LS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695958089; x=1696562889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IiAb/i1gc98L6SazD4d4ItKm7HOWY4Sc1dUvsARnIt8=;
 b=Qh4aQRlzcWriQtJb7Ruqpmg8TUpcgd+LbgLOxqIuypXQ5hp89chm+fNVKW6uKK1QKB
 bPFp1l/ILYIlDAcOwbuoTrNi7yazEuSxydecKdLhCqTszFhTBK7hhPmvRLhJ3Cn2b+Zh
 o9iQRlRhKs/Hz4C9YurOUcXXSXMc8+EM33LTYb57Qeb3CyATd+CP1nGPRJQ2ew29HKs7
 Lcg0CantdgnlnpyBnHmU0RC3q8QUq53+dSi1mCnHioMfgvJ9feoyfS2wFMrGNkAims0B
 sxYblZH6YRiZHtg3ZkXAKclJyR8OaKw0KvXdmvQsOeDOxaAfnDsqKoFxuA2Q9MA+xrOY
 8mNg==
X-Gm-Message-State: AOJu0Yybkz1edTEvwSbiCv5aG3XtXH6oBATAOxGHIrAcmqtG6lTWymXH
 s2uSPBzg017p4P9Lb4IlloxED83LAmpX2IcBRC0=
X-Google-Smtp-Source: AGHT+IFwxD5MHwB8nCElH3p97gGzSZFtR6vWTxEs/mssfRQyF6PkJIQiA0uHM4z+FM+M3FEQI561MxdOs0m92SBkdVk=
X-Received: by 2002:a05:6102:d8:b0:452:6da0:678f with SMTP id
 u24-20020a05610200d800b004526da0678fmr2890488vsp.9.1695958089382; Thu, 28 Sep
 2023 20:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230928110554.34758-1-jlayton@kernel.org>
 <20230928110554.34758-2-jlayton@kernel.org>
 <6020d6e7-b187-4abb-bf38-dc09d8bd0f6d@app.fastmail.com>
 <af047e4a1c6947c59d4a13d4ae221c784a5386b4.camel@kernel.org>
 <20230928171943.GK11439@frogsfrogsfrogs>
In-Reply-To: <20230928171943.GK11439@frogsfrogsfrogs>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 29 Sep 2023 06:27:57 +0300
Message-ID: <CAOQ4uxjTpPPUa3VXW+DWKy72JABOZBCXD6pjNk-FhJZWnqvNPA@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Sep 28, 2023 at 8:19 PM Darrick J. Wong wrote: >
    > On Thu, Sep 28, 2023 at 01:06:03PM -0400, Jeff Layton wrote: > > On Thu,
    2023-09-28 at 11:48 -0400, Arnd Bergmann wrote: > > > On Thu, Se [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.45 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.45 listed in wl.mailspike.net]
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
X-Headers-End: 1qm4Au-0007s9-Ow
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
 "Rafael J . Wysocki" <rafael@kernel.org>, Hugh Dickins <hughd@google.com>,
 Anders Larsen <al@alarsen.net>, Carlos Llamas <cmllamas@google.com>,
 Andrii Nakryiko <andrii@kernel.org>, Mattia Dongili <malattia@linux.it>,
 John Johansen <john.johansen@canonical.com>,
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
 linux-trace-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Kleikamp <shaggy@kernel.org>, samba-technical@lists.samba.org,
 linux-mm@kvack.org, Joel Fernandes <joel@joelfernandes.org>,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, Leon Romanovsky <leon@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, codalist@coda.cs.cmu.edu,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Todd Kjos <tkjos@android.com>,
 Vasily Gorbik <gor@linux.ibm.com>, selinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, Yue Hu <huyue2@coolpad.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Martijn Coenen <maco@android.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net,
 Muchun Song <muchun.song@linux.dev>, linux-f2fs-devel@lists.sourceforge.net,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, gfs2@lists.linux.dev,
 "Eric W. Biederman" <ebiederm@xmission.com>, Anna Schumaker <anna@kernel.org>,
 Brad Warrum <bwarrum@linux.ibm.com>, Mike Kravetz <mike.kravetz@oracle.com>,
 linux-efi@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>,
 ocfs2-devel@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
 platform-driver-x86@vger.kernel.org, Chris Mason <clm@fb.com>,
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
 Evgeniy Dushistov <dushistov@mail.ru>, linux-cifs@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, apparmor@lists.ubuntu.com,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 Hans de Goede <hdegoede@redhat.com>,
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

T24gVGh1LCBTZXAgMjgsIDIwMjMgYXQgODoxOeKAr1BNIERhcnJpY2sgSi4gV29uZyA8ZGp3b25n
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBTZXAgMjgsIDIwMjMgYXQgMDE6MDY6MDNQ
TSAtMDQwMCwgSmVmZiBMYXl0b24gd3JvdGU6Cj4gPiBPbiBUaHUsIDIwMjMtMDktMjggYXQgMTE6
NDggLTA0MDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiA+IE9uIFRodSwgU2VwIDI4LCAyMDIz
LCBhdCAwNzowNSwgSmVmZiBMYXl0b24gd3JvdGU6Cj4gPiA+ID4gVGhpcyBzaGF2ZXMgOCBieXRl
cyBvZmYgc3RydWN0IGlub2RlLCBhY2NvcmRpbmcgdG8gcGFob2xlLgo+ID4gPiA+Cj4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4KPiA+ID4KPiA+
ID4gRldJVywgdGhpcyBpcyBzaW1pbGFyIHRvIHRoZSBhcHByb2FjaCB0aGF0IERlZXBhIHN1Z2dl
c3RlZAo+ID4gPiBiYWNrIGluIDIwMTY6Cj4gPiA+Cj4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xrbWwvMTQ1MjE0NDk3Mi0xNTgwMi0zLWdpdC1zZW5kLWVtYWlsLWRlZXBhLmtlcm5lbEBn
bWFpbC5jb20vCj4gPiA+Cj4gPiA+IEl0IHdhcyBOYUtlZCBhdCB0aGUgdGltZSBiZWNhdXNlIG9m
IHRoZSBhZGRlZCBjb21wbGV4aXR5LAo+ID4gPiB0aG91Z2ggaXQgd291bGQgaGF2ZSBiZWVuIG11
Y2ggZWFzaWVyIHRvIGRvIGl0IHRoZW4sCj4gPiA+IGFzIHdlIGhhZCB0byB0b3VjaCBhbGwgdGhl
IHRpbWVzcGVjIHJlZmVyZW5jZXMgYW55d2F5Lgo+ID4gPgo+ID4gPiBUaGUgYXBwcm9hY2ggc3Rp
bGwgc2VlbXMgb2sgdG8gbWUsIGJ1dCBJJ20gbm90IHN1cmUgaXQncyB3b3J0aAo+ID4gPiBkb2lu
ZyBpdCBub3cgaWYgd2UgZGlkbid0IGRvIGl0IHRoZW4uCj4gPiA+Cj4gPgo+ID4gSSByZW1lbWJl
ciBzZWVpbmcgdGhvc2UgcGF0Y2hlcyBnbyBieS4gSSBkb24ndCByZW1lbWJlciB0aGF0IGNoYW5n
ZQo+ID4gYmVpbmcgTmFLJ2VkLCBidXQgSSB3YXNuJ3QgcGF5aW5nIGNsb3NlIGF0dGVudGlvbiBh
dCB0aGUgdGltZQo+ID4KPiA+IExvb2tpbmcgYXQgaXQgb2JqZWN0aXZlbHkgbm93LCBJIHRoaW5r
IGl0J3Mgd29ydGggaXQgdG8gcmVjb3ZlciA4IGJ5dGVzCj4gPiBwZXIgaW5vZGUgYW5kIG9wZW4g
YSA0IGJ5dGUgaG9sZSB0aGF0IEFtaXIgY2FuIHVzZSB0byBncm93IHRoZQo+ID4gaV9mc25vdGlm
eV9tYXNrLiBXZSBtaWdodCBldmVuIGFibGUgdG8gc2hhdmUgb2ZmIGFub3RoZXIgMTIgYnl0ZXMK
PiA+IGV2ZW50dWFsbHkgaWYgd2UgY2FuIG1vdmUgdG8gYSBzaW5nbGUgNjQtYml0IHdvcmQgcGVy
IHRpbWVzdGFtcC4KPgo+IEkgZG9uJ3QgdGhpbmsgeW91IGNhbiwgc2luY2UgYnRyZnMgdGltZXN0
YW1wcyB1dGlsaXplIHM2NCBzZWNvbmRzCj4gY291bnRpbmcgaW4gYm90aCBkaXJlY3Rpb25zIGZy
b20gdGhlIFVuaXggZXBvY2guICBUaGV5IGFsc28gc3VwcG9ydCBucwo+IHJlc29sdXRpb246Cj4K
PiAgICAgICAgIHN0cnVjdCBidHJmc190aW1lc3BlYyB7Cj4gICAgICAgICAgICAgICAgIF9fbGU2
NCBzZWM7Cj4gICAgICAgICAgICAgICAgIF9fbGUzMiBuc2VjOwo+ICAgICAgICAgfSBfX2F0dHJp
YnV0ZV9fICgoX19wYWNrZWRfXykpOwo+Cj4gLS1ECj4KClN1cmUgd2UgY2FuLgpUaGF0J3Mgd2hh
dCBidHJmc19pbm9kZSBpcyBmb3IuCnZmcyBpbm9kZSBhbHNvIGRvZXMgbm90IHN0b3JlIGlfb3Rp
bWUgKGJpcnRoIHRpbWUpIGFuZCB0aGVyZSBpcyBldmVuIGEKcHJlY2VkZW50IG9mIHZmcy9idHJm
cyB2YXJpYWJsZSBzaXplIG1pc21hdGNoOgoKICAgICAgICAvKiBmdWxsIDY0IGJpdCBnZW5lcmF0
aW9uIG51bWJlciwgc3RydWN0IHZmc19pbm9kZSBkb2Vzbid0IGhhdmUgYSBiaWcKICAgICAgICAg
KiBlbm91Z2ggZmllbGQgZm9yIHRoaXMuCiAgICAgICAgICovCiAgICAgICAgdTY0IGdlbmVyYXRp
b247CgpJZiB3ZSBkZWNpZGUgdGhhdCB2ZnMgc2hvdWxkIHVzZSAiYmlndGltZSIsIGJ0cmZzIHBy
ZS1oaXN0b3JpYwp0aW1lc3RhbXBzIGFyZSBub3QgYSBzaG93IHN0b3BwZXIuCgpUaGFua3MsCkFt
aXIuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
