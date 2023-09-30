Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 950227B413B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 Sep 2023 16:51:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qmbJ9-000111-QM;
	Sat, 30 Sep 2023 14:51:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <smfrench@gmail.com>) id 1qmbJ8-00010e-MQ;
 Sat, 30 Sep 2023 14:51:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=laSU2ptF5dJtGJTOfsu2vTDoKsI4bo31YwsLIpMZHsY=; b=QYcXgV/zM1DFQSOtFbMHGx1A35
 OWHZf5ZKO80OP2+3zGK+BBy57pZxjPog1QpKpxucktZOjhipA6ybnUBhbeAo+oxw3xq+L0qJIe5st
 eB4YV81DRhfub0StKNZ6185UkJgewDtLNel8Bh8Yg3vUeiJh01/qvKD6Wwa628yC+sLQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=laSU2ptF5dJtGJTOfsu2vTDoKsI4bo31YwsLIpMZHsY=; b=KtaqRnq8PPmmA3/SKHq7ZbSrlF
 rRJuBGBUuL4eiq5wKFOVcvolJ9+toJlQHtXUTuVo5Qr9KvncODH/0GKXiJvVVYKYXW9l/2GexxERE
 mD46s8KreL6uvZGE5O2BExPg9A8e4FMeQGm5TA4gpP+qDVgi0s3y9TJrUuzL9j3MVdug=;
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qmbJ6-0008W0-9n; Sat, 30 Sep 2023 14:51:01 +0000
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-50435a9f800so22649276e87.2; 
 Sat, 30 Sep 2023 07:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696085453; x=1696690253; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=laSU2ptF5dJtGJTOfsu2vTDoKsI4bo31YwsLIpMZHsY=;
 b=kORBX+9ksOadhzesInnIVecfTMSZOK/RJeirh0xn937gikQkvyRhaXuuEz5pI+3GSX
 rjv45SeOa/eBs/YzL0LOMHNlXmx8Yt25IhojyvA8fQahtVeHMB++iWNTHnoSTHXERg4z
 qStcS3NW3pZptBxtJNQYI+VEa0LpX/DrJUpExU+MLRzglDvthHDXEAlRPuleRzaWAutj
 smg2T7QRwO5oJ/fw49Oli0utabczQuBOKC0VmvIdTmQQ4D6d7HBWQ0sO/PpgAQ+KYvbR
 VUU1hYoF5zf5dm8BzKbDvdAlBY1F2PE06NbKdfWLp225fsn1CrLbhaPqYMy/Te6lIKx0
 QD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696085453; x=1696690253;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=laSU2ptF5dJtGJTOfsu2vTDoKsI4bo31YwsLIpMZHsY=;
 b=ZvBYK+wMVhi6WDzsKMKcCxob9BKM7DbmLeO121u3hGVAvPGw/2bFrsOnqWti/tXOd9
 v29k4uxK0QMzkBuEH756LVpgXlx4pJeZOHfyyLRUsDNU5xQqKYH4oJfTorJ1Ekpzyc5e
 uBn4zjX51Njsu72bmaLBPdek7h18imhYVcdpFAbBhrDvX0++j4BFikr+Z8cej4piwQcG
 is9fhqTQbJgiaMOMb5e7HageghGa4/OgUT0pQZFLzUXsokTHpgtKV2nrC0Nhnrr2IPY6
 tcbbpyci7UozGxQYmulPDnqahO1DR9XKOUz1p15EmXJYIv9h2s5GNxPoHCt6oWTBEFLC
 N+SQ==
X-Gm-Message-State: AOJu0YzH9BqtBPb5N84Ha4uqwpBo/Kx/FHM+xS386Z9Zyh57BSTJGXn3
 cKEewc46OTNsGdeO9CkeQf7xGdhLmXdOZOotCVQ=
X-Google-Smtp-Source: AGHT+IFKxuEfsWI2Hoye015VefDxXDDWWovJHhYR0GsRnul5m9+uvo7GWv6zNWozBrWHqGB+PwbJIGFbA8W5CapoIHU=
X-Received: by 2002:a05:6512:124a:b0:503:5cd:998b with SMTP id
 fb10-20020a056512124a00b0050305cd998bmr7557694lfb.28.1696085453195; Sat, 30
 Sep 2023 07:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230928110554.34758-1-jlayton@kernel.org>
 <20230928110554.34758-2-jlayton@kernel.org>
 <6020d6e7-b187-4abb-bf38-dc09d8bd0f6d@app.fastmail.com>
 <af047e4a1c6947c59d4a13d4ae221c784a5386b4.camel@kernel.org>
 <20230928171943.GK11439@frogsfrogsfrogs>
 <6a6f37d16b55a3003af3f3dbb7778a367f68cd8d.camel@kernel.org>
 <636661.1695969129@warthog.procyon.org.uk>
In-Reply-To: <636661.1695969129@warthog.procyon.org.uk>
From: Steve French <smfrench@gmail.com>
Date: Sat, 30 Sep 2023 09:50:41 -0500
Message-ID: <CAH2r5ms14hPaz=Ex2a=Dj0Hz3XxYLRKFj_rHHekznTbNJ_wABQ@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Sep 29, 2023 at 3:06 AM David Howells via samba-technical
    wrote: > > > Jeff Layton wrote: > > > Correct. We'd lose some fidelity in
    currently stored timestamps, but as > > Linus and Ted [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.44 listed in list.dnswl.org]
 -0.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.44 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [smfrench[at]gmail.com]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1qmbJ6-0008W0-9n
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
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, Anders Larsen <al@alarsen.net>,
 Carlos Llamas <cmllamas@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Mattia Dongili <malattia@linux.it>, Yonghong Song <yonghong.song@linux.dev>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Michael Ellerman <mpe@ellerman.id.au>,
 James Morris <jmorris@namei.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anton Altaparmakov <anton@tuxera.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Kleikamp <shaggy@kernel.org>, samba-technical@lists.samba.org,
 Marc Dionne <marc.dionne@auristor.com>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@google.com>, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 Leon Romanovsky <leon@kernel.org>, Hugh Dickins <hughd@google.com>,
 Andrii Nakryiko <andrii@kernel.org>, codalist@coda.cs.cmu.edu,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 linux-trace-kernel@vger.kernel.org, Todd Kjos <tkjos@android.com>,
 Vasily Gorbik <gor@linux.ibm.com>, selinux@vger.kernel.org,
 reiserfs-devel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>,
 ocfs2-devel@lists.linux.dev, Yue Hu <huyue2@coolpad.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Martijn Coenen <maco@android.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net,
 Muchun Song <muchun.song@linux.dev>, linux-f2fs-devel@lists.sourceforge.net,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Anna Schumaker <anna@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Brad Warrum <bwarrum@linux.ibm.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, linux-efi@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, Alexei Starovoitov <ast@kernel.org>,
 platform-driver-x86@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-afs@lists.infradead.org,
 Ian Kent <raven@themaw.net>, Naohiro Aota <naohiro.aota@wdc.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-rdma@vger.kernel.org, coda@cs.cmu.edu,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Amir Goldstein <amir73il@gmail.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 autofs@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Mark Gross <markgross@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Eric Paris <eparis@parisplace.org>, ceph-devel@vger.kernel.org,
 Gao Xiang <xiang@kernel.org>, gfs2@lists.linux.dev, linux-nfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>,
 Song Liu <song@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, linux-xfs@vger.kernel.org,
 Jeremy Kerr <jk@ozlabs.org>, Bob Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Chandan Babu R <chandan.babu@oracle.com>, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, Neil Brown <neilb@suse.de>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>, KP Singh <kpsingh@kernel.org>,
 David Sterba <dsterba@suse.cz>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Steve French <sfrench@samba.org>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Salah Triki <salah.triki@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Evgeniy Dushistov <dushistov@mail.ru>, linux-cifs@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, apparmor@lists.ubuntu.com,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 John Johansen <john.johansen@canonical.com>,
 Ritu Agarwal <rituagar@linux.ibm.com>, Luis de Bethencourt <luisbg@kernel.org>,
 Netdev <netdev@vger.kernel.org>, v9fs@lists.linux.dev,
 linux-unionfs@vger.kernel.org, linux-security-module@vger.kernel.org,
 Jeffle Xu <jefflexu@linux.alibaba.com>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Johannes Berg <johannes@sipsolutions.net>, Johannes Thumshirn <jth@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBTZXAgMjksIDIwMjMgYXQgMzowNuKAr0FNIERhdmlkIEhvd2VsbHMgdmlhIHNhbWJh
LXRlY2huaWNhbAo8c2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9yZz4gd3JvdGU6Cj4KPgo+
IEplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gPiBDb3JyZWN0LiBX
ZSdkIGxvc2Ugc29tZSBmaWRlbGl0eSBpbiBjdXJyZW50bHkgc3RvcmVkIHRpbWVzdGFtcHMsIGJ1
dCBhcwo+ID4gTGludXMgYW5kIFRlZCBwb2ludGVkIG91dCwgYW55dGhpbmcgYmVsb3cgfjEwMG5z
IGdyYW51bGFyaXR5IGlzCj4gPiBlZmZlY3RpdmVseSBqdXN0IG5vaXNlLCBhcyB0aGF0J3MgdGhl
IGZsb29yIG92ZXJoZWFkIGZvciBjYWxsaW5nIGludG8KPiA+IHRoZSBrZXJuZWwuIEl0J3MgaGFy
ZCB0byBhcmd1ZSB0aGF0IGFueSBhcHBsaWNhdGlvbiBuZWVkcyB0aGF0IHNvcnQgb2YKPiA+IHRp
bWVzdGFtcCByZXNvbHV0aW9uLCBhdCBsZWFzdCB3aXRoIGNvbnRlbXBvcmFyeSBoYXJkd2FyZS4K
Pgo+IEFsYmVpdCB3aXRoIHRoZSBkYW5nZXIgb2YgbWFraW5nIFN0ZXZlIEZyZW5jaCB2ZXJ5IGhh
cHB5Oy0pLCB3b3VsZCBpdCBtYWtlCj4gc2Vuc2UgdG8gc3dpdGNoIGludGVybmFsbHkgdG8gTWlj
cm9zb2Z0LXN0eWxlIDY0LWJpdCB0aW1lc3RhbXBzIHdpdGggdGhlaXIKPiAxMDBucyBncmFudWxh
cml0eT8KCjEwMG5zIGdyYW51bGFyaXR5IGRvZXMgc2VlbSB0byBtYWtlIHNlbnNlIGFuZCBJSVJD
IHdhcyB1c2VkIGJ5IHZhcmlvdXMKRENFIHN0YW5kYXJkcyBpbiB0aGUgOTBzIGFuZCAyMDAwcyAo
bm90IGp1c3QgdXNlZCBmb3IgU01CMi9TTUIzIHByb3RvY29sIGFuZAp2YXJpb3VzIFdpbmRvd3Mg
ZmlsZXN5c3RlbXMpCgoKLS0gClRoYW5rcywKClN0ZXZlCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
