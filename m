Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F327B1BB1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Sep 2023 14:02:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qlpim-0008Lr-1B;
	Thu, 28 Sep 2023 12:02:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qlpih-0008LV-W1;
 Thu, 28 Sep 2023 12:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1OUz3HfWq12NDsf5pt/6tI4U8Mw0C+kMAWU6iE/wPW8=; b=idQeKwWCHZI40LR4YilfUItS9/
 HaSTIMvX3mCJ+7pY6t3ywLzxylahVzun1cO2awrnQb84s1nzqH04xgmDRDKGRX3fqIR/8LH0yFuz8
 Zs6eUGboruzpLghVi6zBAqy4H588NQmr8BKhGb/xjQLx9Gt31SmA9zeHwtAHRs3UCk04=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1OUz3HfWq12NDsf5pt/6tI4U8Mw0C+kMAWU6iE/wPW8=; b=Kk1sjXrdOKlaF8GF/Sku4kcSvm
 I+faM7uT2K/pJOtIKtJZp3V8gvq2wr0GwTJNo6GZbKyEvv2Uks6Ejq5gMofWf2HdG6AqUlNHRbX6x
 UooejI/709Tu9TF0E0QIYKbO9eD8xk2TQBDrtj301aTWwG6FPoZ08vBG6NBLog4Dc40g=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qlpie-0002rs-OC; Thu, 28 Sep 2023 12:02:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 63305B81BE2;
 Thu, 28 Sep 2023 12:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA9FC433C8;
 Thu, 28 Sep 2023 12:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695902525;
 bh=1OUz3HfWq12NDsf5pt/6tI4U8Mw0C+kMAWU6iE/wPW8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=X75jpHewuenH5i4yKP6hTRRG96bBnvYSW9ppyaPCvnjRr7Vm9FFZm7UX9cHhEdgJN
 9sWsiJl4JoQqsZw/GKoi7gqY0vw1WSuYAKrfeyF1owUUDgi337zCsV6xBykTFrjqQ4
 1IMm02SWv3ExmYV6PPhf6pdloK7xjV68MtysVko9J4sCrAu5RV7rZ7A69VK3LrHZj/
 A70QTwuFIQFa4pBSyL7/hVskPkmrikqba+e0r1Z/ds7+Y2X+m8S6nvykGKta//EbMF
 i8R56KOYB+jvupadzk05Se+6sdUCAkxdoK6c3HGUXdwYBTc4QSGFZzFBPryJ+pbGMH
 lSy4ugTII5Mvw==
Message-ID: <f88106b26a2b647a1541d049999d5546d2ee3e51.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 28 Sep 2023 08:01:50 -0400
In-Reply-To: <CAOQ4uxjSrgGr+6UOs4ADGYCderpQ7hAaPjNmB1DExAPLQQsHSg@mail.gmail.com>
References: <20230928110554.34758-1-jlayton@kernel.org>
 <20230928110554.34758-3-jlayton@kernel.org>
 <CAOQ4uxjSrgGr+6UOs4ADGYCderpQ7hAaPjNmB1DExAPLQQsHSg@mail.gmail.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, 2023-09-28 at 14:35 +0300, Amir Goldstein wrote: >
    On Thu, Sep 28, 2023 at 2:06 PM Jeff Layton <jlayton@kernel.org> wrote:
    > > > > The recent change to use discrete integers instead of struc [...]
    
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qlpie-0002rs-OC
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
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
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
 Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>,
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
 Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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
 linux-erofs@lists.ozlabs.org, "David S.
 Miller" <davem@davemloft.net>, Chandan Babu R <chandan.babu@oracle.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Neil Brown <neilb@suse.de>, Dominique Martinet <asmadeus@codewreck.org>,
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

T24gVGh1LCAyMDIzLTA5LTI4IGF0IDE0OjM1ICswMzAwLCBBbWlyIEdvbGRzdGVpbiB3cm90ZToK
PiBPbiBUaHUsIFNlcCAyOCwgMjAyMyBhdCAyOjA24oCvUE0gSmVmZiBMYXl0b24gPGpsYXl0b25A
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPiAKPiA+IFRoZSByZWNlbnQgY2hhbmdlIHRvIHVzZSBkaXNj
cmV0ZSBpbnRlZ2VycyBpbnN0ZWFkIG9mIHN0cnVjdCB0aW1lc3BlYzY0Cj4gPiBpbiBzdHJ1Y3Qg
aW5vZGUgc2hhdmVkIDggYnl0ZXMgb2ZmIG9mIGl0LCBidXQgaXQgYWxzbyBtb3ZlcyB0aGUgaV9s
b2NrCj4gPiBpbnRvIHRoZSBwcmV2aW91cyBjYWNoZWxpbmUsIGF3YXkgZnJvbSB0aGUgZmllbGRz
IHRoYXQgaXQgcHJvdGVjdHMuCj4gPiAKPiA+IE1vdmUgaV9ibG9ja3MgdXAgYWJvdmUgdGhlIGlf
bG9jaywgd2hpY2ggbW92ZXMgdGhlIG5ldyA0IGJ5dGUgaG9sZSB0bwo+ID4ganVzdCBhZnRlciB0
aGUgdGltZXN0YW1wcywgd2l0aG91dCBjaGFuZ2luZyB0aGUgc2l6ZSBvZiB0aGUgc3RydWN0dXJl
Lgo+ID4gCj4gCj4gSW5zdGVhZCBvZiBjcmVhdGluZyBhbiBpbXBsaWNpdCBob2xlLCBjYW4geW91
IHBsZWFzZSBtb3ZlIGlfZ2VuZXJhdGlvbgo+IHRvIGZpbGwgdGhlIDQgYnl0ZXMgaG9sZS4KPiAK
PiBJdCBtYWtlcyBzZW5zZSBpbiB0aGUgc2FtZSBjYWNoZSBsaW5lIHdpdGggaV9pbm8gYW5kIEkg
Y291bGQKPiB1c2UgdGhlIHZhY2FudCA0IGJ5dGVzIGhvbGUgYWJvdmUgaV9mc25vdGlmeV9tYXNr
IHRvIGV4cGFuZCB0aGUKPiBtYXNrIHRvIDY0Yml0ICh0aGUgMzJiaXQgZXZlbnQgbWFzayBzcGFj
ZSBpcyBydW5uaW5nIG91dCkuCj4gCj4gVGhhbmtzLAo+IEFtaXIuCj4gCgpTb3VuZHMgbGlrZSBh
IHBsYW4uIFJlc3VsdGluZyBzdHJ1Y3QgaW5vZGUgc2l6ZSBpcyB0aGUgc2FtZSAoNjE2IGJ5dGVz
CndpdGggbXkga2Rldm9wcyBrY29uZmlnKS4gQlRXOiBhbGwgb2YgdGhlc2UgY2hhbmdlcyBhcmUg
aW4gbXkgImFtdGltZSIKYnJhbmNoIGlmIGFueW9uZSB3YW50cyB0byBwdWxsIHRoZW0gZG93bi4K
LS0KSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
