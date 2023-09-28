Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6DD7B1B25
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Sep 2023 13:35:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qlpIv-00085e-CG;
	Thu, 28 Sep 2023 11:35:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1qlpIt-00085O-GU;
 Thu, 28 Sep 2023 11:35:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c3oHHfr+yAdtkrxVkV3qE0VFTbMzK/MU2TZf7sFiWp8=; b=PTv7xFKAejLsMcJK50zITt2kvX
 +Slww2kdyg44cR82GNTYJBANrdyQn0aub/ILLd/sn14rhXzGU649I3bXRKh0LsSe//6T6sm1dK/DN
 Iher2Bw+U1lpuS3g7Xx4uprtoUVa//Apl03gOKllmbfzm5DhAtNS9/UiCLU+ogSbVHKU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c3oHHfr+yAdtkrxVkV3qE0VFTbMzK/MU2TZf7sFiWp8=; b=TGAZ9M/V/sZq3kiAV/4z85kM8p
 URZW3bEcHkWvi2/yZlLLADhpdrKfPjF5oOpG6mO0HKVe1UehPkrCNBKXrs6X0X2PU4KUlxd57FtxA
 qeWlLhB0eFFglcAkgkxD25dNesoOUdLNqfmHrYF6NsZyIpQIe1LV/T+SB7KmC4jYTU3M=;
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qlpIo-009qeJ-Fy; Thu, 28 Sep 2023 11:35:33 +0000
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-7afc13d58c6so706541241.1; 
 Thu, 28 Sep 2023 04:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695900924; x=1696505724; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c3oHHfr+yAdtkrxVkV3qE0VFTbMzK/MU2TZf7sFiWp8=;
 b=gFi1RZYDzzd8NabUgp5SSv4zvO0W1U/48ZFWfsP68YvxkG4ZmGeBiAGqXLQqTK2/rO
 o9zGsib/H+KE4TpTvn5t/nRqpTyqpr2IbankSje6+uhMpJf539qNFp4BTO85vM8T54N0
 e006SI0iPhKIbjchnkry+/AvfYwqV9tm+HeB3rH8+AXOdqTWxwB2V9VfarDZRTpjUhmB
 dZALZXrgoRf+tO9A2HUQrmkpphFrAl0zjWh0EGGcOKTFCLvwgp2fUB+P4f9hZe5EPXBT
 B1UMlV8MNAmAqifCZEIlasJuvLfDwjse+ek24Ogn8qoPQKALjd95pm5CJ/MQYASbYneq
 /B0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695900924; x=1696505724;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c3oHHfr+yAdtkrxVkV3qE0VFTbMzK/MU2TZf7sFiWp8=;
 b=iRFobUiQyho7F2fy9jaXWsUTk+kxEOjjK/Ae7Sh39B4/Z+L8d1L5wJ8Q4fw4fTmWS8
 0KP1Z+YSLi5+V3FBDKg0dAr5UfeSOts0/SGSp+EkjWc9NRJsrQjK1L9fjrHoCQnqb7aV
 hPSlrC7bu+1Bec+PyqEZyYIy76z47Z2P8VxMTK1YLrEZKsrXioXZ61zVAV2cAJOWB1SK
 v9zPgTWJ0uef6wkr+e2oZCZ2TlmVKUtEJv8YqApWvBeEEGSLBN0NfS9h5BSpnIYVmKpA
 66OXcb8M+mx8NT8zgSKdU00WlDjbYTaMfzq4e119NMEgSx+lhU3tVe9JAXG5iR7xPSKs
 VcSw==
X-Gm-Message-State: AOJu0YwXPr96kEUBtA81moCxKcEckjjASj7JSTdkHVEXdbwNffkaCncS
 ejO07uf3wLZwMQOcAl1nsBeX/oAbykwy1v+JEZg=
X-Google-Smtp-Source: AGHT+IHhHz7xARweFavd1XDLqmOlGZR89qjTYiX4UH69lO2YZAJePIkqF9BJYGYmOq/G1/CVWLpaXpMDMsrrAqgyB+o=
X-Received: by 2002:a67:ec16:0:b0:452:63b7:2f6d with SMTP id
 d22-20020a67ec16000000b0045263b72f6dmr830755vso.34.1695900924494; Thu, 28 Sep
 2023 04:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230928110554.34758-1-jlayton@kernel.org>
 <20230928110554.34758-3-jlayton@kernel.org>
In-Reply-To: <20230928110554.34758-3-jlayton@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 28 Sep 2023 14:35:13 +0300
Message-ID: <CAOQ4uxjSrgGr+6UOs4ADGYCderpQ7hAaPjNmB1DExAPLQQsHSg@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Sep 28, 2023 at 2:06 PM Jeff Layton wrote: > > The
    recent change to use discrete integers instead of struct timespec64 > in
   struct inode shaved 8 bytes off of it, but it also moves the i_l [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.48 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.48 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [amir73il[at]gmail.com]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1qlpIo-009qeJ-Fy
Subject: Re: [f2fs-dev] [PATCH 87/87] fs: move i_blocks up a few places in
 struct inode
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
 "Rafael J. Wysocki" <rafael@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
 Anders Larsen <al@alarsen.net>, Carlos Llamas <cmllamas@google.com>,
 Andrii Nakryiko <andrii@kernel.org>, Mattia Dongili <malattia@linux.it>,
 Hugh Dickins <hughd@google.com>, John Johansen <john.johansen@canonical.com>,
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
 Dave Kleikamp <shaggy@kernel.org>, linux-mm@kvack.org,
 Joel Fernandes <joel@joelfernandes.org>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@google.com>, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 Leon Romanovsky <leon@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
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
 Eric Biederman <ebiederm@xmission.com>, Anna Schumaker <anna@kernel.org>,
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
 Song Liu <song@kernel.org>, samba-technical@lists.samba.org,
 Steve French <sfrench@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 netdev@vger.kernel.org, Bob Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
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

T24gVGh1LCBTZXAgMjgsIDIwMjMgYXQgMjowNuKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhlIHJlY2VudCBjaGFuZ2UgdG8gdXNlIGRpc2NyZXRlIGlu
dGVnZXJzIGluc3RlYWQgb2Ygc3RydWN0IHRpbWVzcGVjNjQKPiBpbiBzdHJ1Y3QgaW5vZGUgc2hh
dmVkIDggYnl0ZXMgb2ZmIG9mIGl0LCBidXQgaXQgYWxzbyBtb3ZlcyB0aGUgaV9sb2NrCj4gaW50
byB0aGUgcHJldmlvdXMgY2FjaGVsaW5lLCBhd2F5IGZyb20gdGhlIGZpZWxkcyB0aGF0IGl0IHBy
b3RlY3RzLgo+Cj4gTW92ZSBpX2Jsb2NrcyB1cCBhYm92ZSB0aGUgaV9sb2NrLCB3aGljaCBtb3Zl
cyB0aGUgbmV3IDQgYnl0ZSBob2xlIHRvCj4ganVzdCBhZnRlciB0aGUgdGltZXN0YW1wcywgd2l0
aG91dCBjaGFuZ2luZyB0aGUgc2l6ZSBvZiB0aGUgc3RydWN0dXJlLgo+CgpJbnN0ZWFkIG9mIGNy
ZWF0aW5nIGFuIGltcGxpY2l0IGhvbGUsIGNhbiB5b3UgcGxlYXNlIG1vdmUgaV9nZW5lcmF0aW9u
CnRvIGZpbGwgdGhlIDQgYnl0ZXMgaG9sZS4KCkl0IG1ha2VzIHNlbnNlIGluIHRoZSBzYW1lIGNh
Y2hlIGxpbmUgd2l0aCBpX2lubyBhbmQgSSBjb3VsZAp1c2UgdGhlIHZhY2FudCA0IGJ5dGVzIGhv
bGUgYWJvdmUgaV9mc25vdGlmeV9tYXNrIHRvIGV4cGFuZCB0aGUKbWFzayB0byA2NGJpdCAodGhl
IDMyYml0IGV2ZW50IG1hc2sgc3BhY2UgaXMgcnVubmluZyBvdXQpLgoKVGhhbmtzLApBbWlyLgoK
PiBTaWduZWQtb2ZmLWJ5OiBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3JnPgo+IC0tLQo+
ICBpbmNsdWRlL2xpbnV4L2ZzLmggfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZnMuaCBi
L2luY2x1ZGUvbGludXgvZnMuaAo+IGluZGV4IGRlOTAyZmYyOTM4Yi4uM2UwZmUwZjUyZTdjIDEw
MDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvZnMuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvZnMu
aAo+IEBAIC02NzcsMTEgKzY3NywxMSBAQCBzdHJ1Y3QgaW5vZGUgewo+ICAgICAgICAgdTMyICAg
ICAgICAgICAgICAgICAgICAgaV9hdGltZV9uc2VjOwo+ICAgICAgICAgdTMyICAgICAgICAgICAg
ICAgICAgICAgaV9tdGltZV9uc2VjOwo+ICAgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAg
aV9jdGltZV9uc2VjOwo+ICsgICAgICAgYmxrY250X3QgICAgICAgICAgICAgICAgaV9ibG9ja3M7
Cj4gICAgICAgICBzcGlubG9ja190ICAgICAgICAgICAgICBpX2xvY2s7IC8qIGlfYmxvY2tzLCBp
X2J5dGVzLCBtYXliZSBpX3NpemUgKi8KPiAgICAgICAgIHVuc2lnbmVkIHNob3J0ICAgICAgICAg
IGlfYnl0ZXM7Cj4gICAgICAgICB1OCAgICAgICAgICAgICAgICAgICAgICBpX2Jsa2JpdHM7Cj4g
ICAgICAgICB1OCAgICAgICAgICAgICAgICAgICAgICBpX3dyaXRlX2hpbnQ7Cj4gLSAgICAgICBi
bGtjbnRfdCAgICAgICAgICAgICAgICBpX2Jsb2NrczsKPgo+ICAjaWZkZWYgX19ORUVEX0lfU0la
RV9PUkRFUkVECj4gICAgICAgICBzZXFjb3VudF90ICAgICAgICAgICAgICBpX3NpemVfc2VxY291
bnQ7Cj4gLS0KPiAyLjQxLjAKPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
