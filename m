Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E56B47B457C
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 Oct 2023 07:52:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qmpNb-0001xT-UU;
	Sun, 01 Oct 2023 05:52:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <paubert@iram.es>) id 1qmpNa-0001xE-1Q;
 Sun, 01 Oct 2023 05:52:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5JgHwkJ5bZA+PRufvniyMuRJN1Jr6719sKCuadOAMmw=; b=JkaSA0avVLuUCnuzsMW92yPnv+
 +FyC43TneFwUKyyjXL2Ncbptx8XpB/j5xDdmwpUaTdtetNpPZdDpPwhhvHNVY5LoaegawVPd1zidF
 SIksbDNCR3SwmAQ6zuzSjt77OM9XOJBe8N5OlzSFvXVKgxyFSMwMf4SsIH70maFORwZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5JgHwkJ5bZA+PRufvniyMuRJN1Jr6719sKCuadOAMmw=; b=k8v0EBNEvCroE3Gw0FrOD3Ab2Y
 wYfAiqtgd/VaTdTiTTelzj2ODixJcJq2o0lpUJI0GcmFvP4Tcifv9FxmTbIele4H6Qb3B7dzKotvK
 wiYKLPhfVP2kXc7Q8bVwz5YhrWls8m78vk0h8cR9AJaIH2x8tuqcdfkqdBb3kNwYlKis=;
Received: from mx07-006a4e02.pphosted.com ([143.55.146.78])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qmpNM-0002MY-38; Sun, 01 Oct 2023 05:52:32 +0000
Received: from pps.filterd (m0316689.ppops.net [127.0.0.1])
 by m0316689.ppops.net (8.17.1.22/8.17.1.22) with ESMTP id 3914UFP5026780;
 Sun, 1 Oct 2023 07:02:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iram.es; h=date
 :from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to:content-transfer-encoding; s=dkim3;
 bh=5JgHwkJ5bZA+PRufvniyMuRJN1Jr6719sKCuadOAMmw=; b=hDNmwqgug1An
 fvwB2cRTfoutFDu+tai+5nrTyDJGpD0Pkv+UoD9dDHnHHIAd09gz+r02mse1Cs9K
 ZCgOca/WGL5QjFanXXswWHZ9gsDFv9HUsGVbSl0NWG9zgx7F1IrS1vcyAC4I2TBu
 vtCiSXblwT2BOKB168GcAoNAG3zywK5ZIdX9TFP4bHS8GBFExgd9NXibijGF4eid
 NlYGioPXJRFaYlb2eKu0casy5f5iNW/FoS1c0RbxZP9tWhnpwN4+plV0Uq3PyrZu
 vjfbiPtJ7zPzKAVMjvhFWJMgaNJzLRSZANzAdWFrm7A8N1ie1vidQt1Dp6QldrsP
 8q3fZB20SA==
Received: from sim.rediris.es (mta-out04.sim.rediris.es [130.206.24.46])
 by m0316689.ppops.net (PPS) with ESMTPS id 3texu6gh7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 01 Oct 2023 07:02:19 +0200 (MEST)
Received: from sim.rediris.es (localhost.localdomain [127.0.0.1])
 by sim.rediris.es (Postfix) with ESMTPS id EDE8B180084;
 Sun,  1 Oct 2023 07:02:16 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by sim.rediris.es (Postfix) with ESMTP id 4925B183220;
 Sun,  1 Oct 2023 07:02:16 +0200 (CEST)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out04.sim.rediris.es
Received: from sim.rediris.es ([127.0.0.1])
 by localhost (mta-out04.sim.rediris.es [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Dld0OOiAMFpc; Sun,  1 Oct 2023 07:02:13 +0200 (CEST)
Received: from gp-workstation.iram.es (haproxy01.sim.rediris.es
 [130.206.24.69])
 by sim.rediris.es (Postfix) with ESMTPA id 96282180084;
 Sun,  1 Oct 2023 07:01:58 +0200 (CEST)
Date: Sun, 1 Oct 2023 07:01:56 +0200
From: Gabriel Paubert <paubert@iram.es>
To: Steve French <smfrench@gmail.com>
Message-ID: <20231001050156.GA3366643@gp-workstation.iram.es>
References: <20230928110554.34758-1-jlayton@kernel.org>
 <20230928110554.34758-2-jlayton@kernel.org>
 <6020d6e7-b187-4abb-bf38-dc09d8bd0f6d@app.fastmail.com>
 <af047e4a1c6947c59d4a13d4ae221c784a5386b4.camel@kernel.org>
 <20230928171943.GK11439@frogsfrogsfrogs>
 <6a6f37d16b55a3003af3f3dbb7778a367f68cd8d.camel@kernel.org>
 <636661.1695969129@warthog.procyon.org.uk>
 <CAH2r5ms14hPaz=Ex2a=Dj0Hz3XxYLRKFj_rHHekznTbNJ_wABQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH2r5ms14hPaz=Ex2a=Dj0Hz3XxYLRKFj_rHHekznTbNJ_wABQ@mail.gmail.com>
X-Proofpoint-ORIG-GUID: 36zzUCLp18nPYUNdv6OeNHkJL1ErgJPK
X-Proofpoint-GUID: 36zzUCLp18nPYUNdv6OeNHkJL1ErgJPK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-01_02,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=salida_notspam policy=salida score=0
 mlxscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=871 spamscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2309180000
 definitions=main-2310010040
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sat, Sep 30, 2023 at 09:50:41AM -0500, Steve French wrote:
    > On Fri, Sep 29, 2023 at 3:06 AM David Howells via samba-technical > <samba-technical@lists.samba.org>
    wrote: > > > > > > Jeff Layton < [...] 
 
 Content analysis details:   (0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [143.55.146.78 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.4 RDNS_DYNAMIC           Delivered to internal network by host with
                             dynamic-looking rDNS
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
  0.0 PDS_RDNS_DYNAMIC_FP    RDNS_DYNAMIC with FP steps
X-Headers-End: 1qmpNM-0002MY-38
Subject: [f2fs-dev] [OT] Re: [PATCH 86/87] fs: switch timespec64 fields in
 inode to discrete integers
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
 Carlos Llamas <cmllamas@google.com>, Mattia Dongili <malattia@linux.it>,
 Yonghong Song <yonghong.song@linux.dev>, v9fs@li.sts.linux.dev,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 James Morris <jmorris@namei.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, linux-um@lists.infradead.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anton Altaparmakov <anton@tuxera.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kr oah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Kleikamp <shaggy@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 linux-mm@kvack.org, Joel Fernandes <joel@joelfernandes.org>,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, Leon Romanovsky <leon@kernel.org>,
 Hugh Dickins <hughd@google.com>, Andrii Nakryiko <andrii@kernel.org>,
 codalist@coda.cs.cmu.edu, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
 Todd Kjos <tkjos@android.com>, Vasily Gorbik <gor@linux.ibm.com>,
 selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, Yue Hu <huyue2@coolpad.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Martijn Coenen <maco@android.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net,
 Muchun Song <muchun.song@linux.dev>, linux-f2fs-devel@lists.sourceforge.net,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, gfs2@lists.linux.dev,
 "Eric W. Biederman" <ebiederm@xmission.com>, Anna Schumaker <anna@kernel.org>,
 Brad Warrum <bwarrum@linux.ibm.com>, Mike Kravetz <mike.kravetz@oracle.com>,
 linux-efi@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>,
 Alexei Starovoitov <ast@kernel.org>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 Marc Dionne <marc.dionne@auristor.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-afs@lists.infradead.org, Ian Kent <raven@themaw.net>,
 Naohiro Aota <naohiro.aota@wdc.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-rdma@vger.kernel.org,
 Steve French <sfrench@samba.org>, platform-driver-x86@vger.kernel.or.g,
 coda@cs.cmu.edu,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 autofs@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Mark Gross <markgross@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Eric Paris <eparis@parisplace.org>, ceph-devel@vger.kernel.org,
 Gao Xiang <xiang@kernel.org>, Johannes Thumshirn <jth@kernel.org>,
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-nfs@vger.kernel.org,
 Olga Kornievskaia <kolga@netapp.com>, Song Liu <song@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, samba-technical@lists.samba.org,
 linux-xfs@vger.kernel.org, Jeremy Kerr <jk@ozlabs.org>,
 Netdev <netdev@vger.kernel.org>, Bob Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Chandan Babu R <chandan.babu@oracle.com>, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, Neil Brown <neilb@suse.de>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Amir Goldstein <amir73il@gmail.com>, Bob Copeland <me@bobcopeland.com>,
 KP Singh <kpsingh@kernel.org>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, linux-ext4@vger.ker.nel.org,
 Dai Ngo <Dai.Ngo@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Salah Triki <salah.triki@gmail.com>, John Fastabend <john.fastabend@gmail.com>,
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
 Martin KaFai Lau <martin.lau@linux.dev>, David Sterba <dsterba@suse.cz>,
 linux-security-module@vger.kernel.org, Jeffle Xu <jefflexu@linux.alibaba.com>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Johannes Berg <johannes@sipsolutions.net>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU2F0LCBTZXAgMzAsIDIwMjMgYXQgMDk6NTA6NDFBTSAtMDUwMCwgU3RldmUgRnJlbmNoIHdy
b3RlOgo+IE9uIEZyaSwgU2VwIDI5LCAyMDIzIGF0IDM6MDbigK9BTSBEYXZpZCBIb3dlbGxzIHZp
YSBzYW1iYS10ZWNobmljYWwKPiA8c2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9yZz4gd3Jv
dGU6Cj4gPgo+ID4KPiA+IEplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+IHdyb3RlOgo+
ID4KPiA+ID4gQ29ycmVjdC4gV2UnZCBsb3NlIHNvbWUgZmlkZWxpdHkgaW4gY3VycmVudGx5IHN0
b3JlZCB0aW1lc3RhbXBzLCBidXQgYXMKPiA+ID4gTGludXMgYW5kIFRlZCBwb2ludGVkIG91dCwg
YW55dGhpbmcgYmVsb3cgfjEwMG5zIGdyYW51bGFyaXR5IGlzCj4gPiA+IGVmZmVjdGl2ZWx5IGp1
c3Qgbm9pc2UsIGFzIHRoYXQncyB0aGUgZmxvb3Igb3ZlcmhlYWQgZm9yIGNhbGxpbmcgaW50bwo+
ID4gPiB0aGUga2VybmVsLiBJdCdzIGhhcmQgdG8gYXJndWUgdGhhdCBhbnkgYXBwbGljYXRpb24g
bmVlZHMgdGhhdCBzb3J0IG9mCj4gPiA+IHRpbWVzdGFtcCByZXNvbHV0aW9uLCBhdCBsZWFzdCB3
aXRoIGNvbnRlbXBvcmFyeSBoYXJkd2FyZS4KPiA+Cj4gPiBBbGJlaXQgd2l0aCB0aGUgZGFuZ2Vy
IG9mIG1ha2luZyBTdGV2ZSBGcmVuY2ggdmVyeSBoYXBweTstKSwgd291bGQgaXQgbWFrZQo+ID4g
c2Vuc2UgdG8gc3dpdGNoIGludGVybmFsbHkgdG8gTWljcm9zb2Z0LXN0eWxlIDY0LWJpdCB0aW1l
c3RhbXBzIHdpdGggdGhlaXIKPiA+IDEwMG5zIGdyYW51bGFyaXR5Pwo+IAo+IDEwMG5zIGdyYW51
bGFyaXR5IGRvZXMgc2VlbSB0byBtYWtlIHNlbnNlIGFuZCBJSVJDIHdhcyB1c2VkIGJ5IHZhcmlv
dXMKPiBEQ0Ugc3RhbmRhcmRzIGluIHRoZSA5MHMgYW5kIDIwMDBzIChub3QganVzdCB1c2VkIGZv
ciBTTUIyL1NNQjMgcHJvdG9jb2wgYW5kCj4gdmFyaW91cyBXaW5kb3dzIGZpbGVzeXN0ZW1zKQoK
SGlzdG9yaWNhbGx5IGl0IHByb2JhYmx5IGNvbWVzIGZyb20gVk1TLCB3aGVyZSBzeXN0ZW0gdGlt
ZSBhbmQgZmlsZQp0aW1lc3RhbXBzIHdlcmUgYSA2NCBiaXQgaW50ZWdlciBjb3VudGluZyBpbiAx
MDBucyB1bml0cyBzdGFydGluZyBvbiBNSkQKMjQwMDAwMC41IChOb3YgMTd0aCAxODU4KS4KCkdh
YnJpZWwKCj4gCj4gCj4gLS0gCj4gVGhhbmtzLAo+IAo+IFN0ZXZlCiAKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
