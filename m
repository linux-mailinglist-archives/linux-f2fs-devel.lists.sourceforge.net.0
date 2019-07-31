Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C60D7CA33
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jul 2019 19:20:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EFjpPWKGDkC6mNew5iZeRTCaeUkl7YG8yV7PMt5Q8cw=; b=Dr7MmIpwMbWs4EG3apaMzTH8R
	saAazmJBrq49xrzX5TBDZ3FKh0fpEtrwgCFwjoyn+tSB7+DZe6V6O0rt2CzE+n1hT0Sf0HNNfYsI4
	OhfASjR3hIGlVIwk32bt5zPvqR4ngHVU8YwLcgzOKNdUnorJblA6FQrclian+FBaE81jQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hssGo-00055C-6r; Wed, 31 Jul 2019 17:20:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <salyzyn@android.com>) id 1hssGn-000556-Hf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Jul 2019 17:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p6RSnHZej7dMZQfosYc1rQOAXMnG8HF3vzAcSS3MG98=; b=Mayoj0shkEHRF3VeQp3v3vCLbg
 pMNGIdxqIzo1DS0uckxNaFwK+20efe88B09joh90jN+z2UkqaZj3Anw03LCRGa5z65GHBsH+nzenK
 0F3AGRNGSSjAmEbcWCLxPqJ+/TvfwPyLiEpcm3MWW6YueytZnj5fC2pmSilUpgQfaSdQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p6RSnHZej7dMZQfosYc1rQOAXMnG8HF3vzAcSS3MG98=; b=btEcMfTvlsqcCh5ZXlpnTuiD+2
 zdecsGBJetphUAn++MZNd+1t+pSbiCKpjXuTp+eaR3hdRcK+38TQARVDMZtySMBQJ7zQBNCD96Zyu
 MOVSVj1iodtk5G6q8zKkqqsvKYEfAv3iBpC2ID8TeK6kEokD4UYNjXJGPwfdltTX3mHo=;
Received: from mail-pl1-f194.google.com ([209.85.214.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hssGh-005TgH-LI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Jul 2019 17:20:09 +0000
Received: by mail-pl1-f194.google.com with SMTP id c2so30746635plz.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 Jul 2019 10:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p6RSnHZej7dMZQfosYc1rQOAXMnG8HF3vzAcSS3MG98=;
 b=fmiQSh9yv929qF/IP6Uym2pEsxsKnDznkX0VjJ8cIh+7NzZrkbqvPCG3bssMygeAbK
 NmkNsix4uTqi91gMmHKksLpNQD7b0D1A9bda6aSayMw9sPfvhUAJO63BySMzz39Ednc6
 +iWQAfEEJ8NQ6QfBslJvC3DyBQUS6s3R1R0XZUZMZgKOLtN+EIac6ejHjwc9qbdb5uvz
 eiCuyG0A6yFWZLw5lHrPP3O5DsRBGnqxHkq8vNdP6QJnUoh2+fIqC3yhPbsH+qEpXwib
 mUbx7N0k3Aa9YqKq/FSCQYABcvQoWcmd3n7QaLFSg3+9u/w9YuhZ+4mMF/9YdnWbfIFZ
 JhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p6RSnHZej7dMZQfosYc1rQOAXMnG8HF3vzAcSS3MG98=;
 b=skFS5PF3Kg6hikE6wUHAu4XFYvWU2u1kKqZqs9J4rBuk76AiGdij8duEs5H0ypD4dt
 9pcp+l87A4xueBXDJRAfnBhu781rH2jKnJQsMHJ+iFy1entm7+7N4REUqxjKstyYkGfu
 41fMIKv9QdAcPWqWrSRhS2pPbXFbDLftG4yQer9C8x3Coh09KyL0ZQgV2WDwQdhgF0B+
 2o6m9cbD5gJC9bkoU0uUexWGmUeTzcrv1k+wuvKRyZ1miIsIhP4/V2OiggGBu2ExEgpx
 U56O7N8VJtlzJdEE8nUzLq9O3zvZaNXfobWJREREL9hqmC3G1NSf3pPymyvvWqjoryxR
 URrQ==
X-Gm-Message-State: APjAAAWAJuA9ITRPVdAVhSr+jS2D1QittVczajgr6N0pDQEsMDGopnFr
 fguGsREdEemhsVQlb0/9PEo=
X-Google-Smtp-Source: APXvYqyB1157MtzfYeWJ1dBcWuMDKOUJgOnzq0VC5i1SowoHtyq/iVzFaALo7AjUpN0O6A6XZS+NfQ==
X-Received: by 2002:a17:902:9a85:: with SMTP id
 w5mr121452633plp.221.1564592333814; 
 Wed, 31 Jul 2019 09:58:53 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com
 ([2620:15c:211:200:5404:91ba:59dc:9400])
 by smtp.gmail.com with ESMTPSA id f72sm2245954pjg.10.2019.07.31.09.58.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 09:58:53 -0700 (PDT)
To: linux-kernel@vger.kernel.org
Date: Wed, 31 Jul 2019 09:57:59 -0700
Message-Id: <20190731165803.4755-5-salyzyn@android.com>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
In-Reply-To: <20190731165803.4755-1-salyzyn@android.com>
References: <20190731165803.4755-1-salyzyn@android.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: evilplan.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hssGh-005TgH-LI
Subject: [f2fs-dev] [PATCH v13 4/5] overlayfs: internal getxattr operations
 without sepolicy checking
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
From: Mark Salyzyn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mark Salyzyn <salyzyn@android.com>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 jfs-discussion@lists.sourceforge.net, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>,
 samba-technical@lists.samba.org, Dominique Martinet <asmadeus@codewreck.org>,
 Amir Goldstein <amir73il@gmail.com>, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, "David S . Miller" <davem@davemloft.net>,
 Andreas Dilger <adilger.kernel@dilger.ca>, ocfs2-devel@oss.oracle.com,
 netdev@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 devel@lists.orangefs.org, Hugh Dickins <hughd@google.com>,
 linux-security-module@vger.kernel.org, cluster-devel@redhat.com,
 Vyacheslav Dubeyko <slava@dubeyko.com>, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Stephen Smalley <sds@tycho.nsa.gov>, linux-mm@kvack.org,
 Vivek Goyal <vgoyal@redhat.com>, linux-cifs@vger.kernel.org,
 Eric Van Hensbergen <ericvh@gmail.com>, ecryptfs@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, reiserfs-devel@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Becker <jlbec@evilplan.org>, linux-mtd@lists.infradead.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-nfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Mathieu Malaterre <malat@debian.org>,
 kernel-team@android.com, Miklos Szeredi <miklos@szeredi.hu>,
 Jeff Layton <jlayton@kernel.org>, linux-unionfs@vger.kernel.org,
 stable@vger.kernel.org, Mark Salyzyn <salyzyn@android.com>,
 Steve French <sfrench@samba.org>,
 =?UTF-8?q?Ernesto=20A=20=2E=20Fern=C3=A1ndez?=
 <ernesto.mnd.fernandez@gmail.com>,
 "Eric W . Biederman" <ebiederm@xmission.com>, Jan Kara <jack@suse.com>,
 Bob Peterson <rpeterso@redhat.com>, Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hlY2sgaW1wdXJlLCBvcGFxdWUsIG9yaWdpbiAmIG1ldGEgeGF0dHIgd2l0aCBubyBzZXBvbGlj
eSBhdWRpdAoodXNpbmcgX192ZnNfZ2V0eGF0dHIpIHNpbmNlIHRoZXNlIG9wZXJhdGlvbnMgYXJl
IGludGVybmFsIHRvCm92ZXJsYXlmcyBvcGVyYXRpb25zIGFuZCBkbyBub3QgZGlzY2xvc2UgYW55
IGRhdGEuICBUaGlzIGJlY2FtZQphbiBpc3N1ZSBmb3IgY3JlZGVudGlhbCBvdmVycmlkZSBvZmYg
c2luY2Ugc3lzX2FkbWluIHdvdWxkIGhhdmUKYmVlbiByZXF1aXJlZCBieSB0aGUgY2FsbGVyOyB3
aGVyZWFzIHdvdWxkIGhhdmUgYmVlbiBpbmhlcmVudGx5CnByZXNlbnQgZm9yIHRoZSBjcmVhdG9y
IHNpbmNlIGl0IHBlcmZvcm1lZCB0aGUgbW91bnQuCgpUaGlzIGlzIGEgY2hhbmdlIGluIG9wZXJh
dGlvbnMgc2luY2Ugd2UgZG8gbm90IGNoZWNrIGluIHRoZSBuZXcKb3ZsX2RvX3Zmc19nZXR4YXR0
ciBmdW5jdGlvbiBpZiB0aGUgY3JlZGVudGlhbCBvdmVycmlkZSBpcyBvZmYgb3IKbm90LiAgUmVh
c29uaW5nIGlzIHRoYXQgdGhlIHNlcG9saWN5IGNoZWNrIGlzIHVubmVjZXNzYXJ5IG92ZXJoZWFk
LAplc3BlY2lhbGx5IHNpbmNlIHRoZSBjaGVjayBjYW4gYmUgZXhwZW5zaXZlLgoKQmVjYXVzZSBm
b3Igb3ZlcnJpZGUgY3JlZGVudGlhbHMgb2ZmLCB0aGlzIGFmZmVjdHMgX2V2ZXJ5b25lXyB0aGF0
CnVuZGVybmVhdGggcGVyZm9ybXMgcHJpdmF0ZSB4YXR0ciBjYWxscyB3aXRob3V0IHRoZSBhcHBy
b3ByaWF0ZQpzZXBvbGljeSBwZXJtaXNzaW9ucyBhbmQgc3lzX2FkbWluIGNhcGFiaWxpdHkuICBQ
cm92aWRpbmcgYmxhbmtldApzdXBwb3J0IGZvciBzeXNfYWRtaW4gd291bGQgYmUgYmFkIGZvciBh
bGwgcG9zc2libGUgY2FsbGVycy4KCkZvciB0aGUgb3ZlcnJpZGUgY3JlZGVudGlhbHMgb24sIHRo
aXMgd2lsbCBhZmZlY3Qgb25seSB0aGUgbW91bnRlciwKc2hvdWxkIGl0IGxhY2sgc2Vwb2xpY3kg
cGVybWlzc2lvbnMuIE5vdCBjb25zaWRlcmVkIGEgc2VjdXJpdHkKcHJvYmxlbSBzaW5jZSBtb3Vu
dGluZyBieSBkZWZpbml0aW9uIGhhcyBzeXNfYWRtaW4gY2FwYWJpbGl0aWVzLApidXQgc2Vwb2xp
Y3kgY29udGV4dHMgd291bGQgc3RpbGwgbmVlZCB0byBiZSBjcmFmdGVkLgoKSXQgc2hvdWxkIGJl
IG5vdGVkIHRoYXQgdGhlcmUgaXMgcHJlY2VkZW5jZSwgX192ZnNfZ2V0eGF0dHIgaXMgdXNlZApp
biBvdGhlciBmaWxlc3lzdGVtcyBmb3IgdGhlaXIgb3duIGludGVybmFsIHRydXN0ZWQgeGF0dHIg
bWFuYWdlbWVudC4KClNpZ25lZC1vZmYtYnk6IE1hcmsgU2FseXp5biA8c2FseXp5bkBhbmRyb2lk
LmNvbT4KQ2M6IE1pa2xvcyBTemVyZWRpIDxtaWtsb3NAc3plcmVkaS5odT4KQ2M6IEpvbmF0aGFu
IENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+CkNjOiBWaXZlayBHb3lhbCA8dmdveWFsQHJlZGhhdC5j
b20+CkNjOiBFcmljIFcuIEJpZWRlcm1hbiA8ZWJpZWRlcm1AeG1pc3Npb24uY29tPgpDYzogQW1p
ciBHb2xkc3RlaW4gPGFtaXI3M2lsQGdtYWlsLmNvbT4KQ2M6IFJhbmR5IER1bmxhcCA8cmR1bmxh
cEBpbmZyYWRlYWQub3JnPgpDYzogU3RlcGhlbiBTbWFsbGV5IDxzZHNAdHljaG8ubnNhLmdvdj4K
Q2M6IGxpbnV4LXVuaW9uZnNAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1kb2NAdmdlci5rZXJu
ZWwub3JnCkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCkNjOiBrZXJuZWwtdGVhbUBh
bmRyb2lkLmNvbQpDYzogRXJpYyBWYW4gSGVuc2JlcmdlbiA8ZXJpY3ZoQGdtYWlsLmNvbT4KQ2M6
IExhdGNoZXNhciBJb25rb3YgPGx1Y2hvQGlvbmtvdi5uZXQ+CkNjOiBEb21pbmlxdWUgTWFydGlu
ZXQgPGFzbWFkZXVzQGNvZGV3cmVjay5vcmc+CkNjOiBEYXZpZCBIb3dlbGxzIDxkaG93ZWxsc0By
ZWRoYXQuY29tPgpDYzogQ2hyaXMgTWFzb24gPGNsbUBmYi5jb20+CkNjOiBKb3NlZiBCYWNpayA8
am9zZWZAdG94aWNwYW5kYS5jb20+CkNjOiBEYXZpZCBTdGVyYmEgPGRzdGVyYmFAc3VzZS5jb20+
CkNjOiBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3JnPgpDYzogU2FnZSBXZWlsIDxzYWdl
QHJlZGhhdC5jb20+CkNjOiBJbHlhIERyeW9tb3YgPGlkcnlvbW92QGdtYWlsLmNvbT4KQ2M6IFN0
ZXZlIEZyZW5jaCA8c2ZyZW5jaEBzYW1iYS5vcmc+CkNjOiBUeWxlciBIaWNrcyA8dHloaWNrc0Bj
YW5vbmljYWwuY29tPgpDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jb20+CkNjOiBUaGVvZG9yZSBU
cydvIDx0eXRzb0BtaXQuZWR1PgpDYzogQW5kcmVhcyBEaWxnZXIgPGFkaWxnZXIua2VybmVsQGRp
bGdlci5jYT4KQ2M6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+CkNjOiBDaGFvIFl1
IDx5dWNoYW8wQGh1YXdlaS5jb20+CkNjOiBCb2IgUGV0ZXJzb24gPHJwZXRlcnNvQHJlZGhhdC5j
b20+CkNjOiBBbmRyZWFzIEdydWVuYmFjaGVyIDxhZ3J1ZW5iYUByZWRoYXQuY29tPgpDYzogRGF2
aWQgV29vZGhvdXNlIDxkd213MkBpbmZyYWRlYWQub3JnPgpDYzogUmljaGFyZCBXZWluYmVyZ2Vy
IDxyaWNoYXJkQG5vZC5hdD4KQ2M6IERhdmUgS2xlaWthbXAgPHNoYWdneUBrZXJuZWwub3JnPgpD
YzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IFRl
anVuIEhlbyA8dGpAa2VybmVsLm9yZz4KQ2M6IFRyb25kIE15a2xlYnVzdCA8dHJvbmQubXlrbGVi
dXN0QGhhbW1lcnNwYWNlLmNvbT4KQ2M6IEFubmEgU2NodW1ha2VyIDxhbm5hLnNjaHVtYWtlckBu
ZXRhcHAuY29tPgpDYzogTWFyayBGYXNoZWggPG1hcmtAZmFzaGVoLmNvbT4KQ2M6IEpvZWwgQmVj
a2VyIDxqbGJlY0BldmlscGxhbi5vcmc+CkNjOiBKb3NlcGggUWkgPGpvc2VwaC5xaUBsaW51eC5h
bGliYWJhLmNvbT4KQ2M6IE1pa2UgTWFyc2hhbGwgPGh1YmNhcEBvbW5pYm9uZC5jb20+CkNjOiBN
YXJ0aW4gQnJhbmRlbmJ1cmcgPG1hcnRpbkBvbW5pYm9uZC5jb20+CkNjOiBBbGV4YW5kZXIgVmly
byA8dmlyb0B6ZW5pdi5saW51eC5vcmcudWs+CkNjOiBQaGlsbGlwIExvdWdoZXIgPHBoaWxsaXBA
c3F1YXNoZnMub3JnLnVrPgpDYzogRGFycmljayBKLiBXb25nIDxkYXJyaWNrLndvbmdAb3JhY2xl
LmNvbT4KQ2M6IGxpbnV4LXhmc0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IEh1Z2ggRGlja2lucyA8aHVn
aGRAZ29vZ2xlLmNvbT4KQ2M6IERhdmlkIFMuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4K
Q2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBNYXRoaWV1
IE1hbGF0ZXJyZSA8bWFsYXRAZGViaWFuLm9yZz4KQ2M6IEVybmVzdG8gQS4gRmVybsOhbmRleiA8
ZXJuZXN0by5tbmQuZmVybmFuZGV6QGdtYWlsLmNvbT4KQ2M6IFZ5YWNoZXNsYXYgRHViZXlrbyA8
c2xhdmFAZHViZXlrby5jb20+CkNjOiB2OWZzLWRldmVsb3BlckBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKQ2M6IGxpbnV4LWFmc0BsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1idHJmc0B2Z2Vy
Lmtlcm5lbC5vcmcKQ2M6IGNlcGgtZGV2ZWxAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1jaWZz
QHZnZXIua2VybmVsLm9yZwpDYzogc2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9yZwpDYzog
ZWNyeXB0ZnNAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1leHQ0QHZnZXIua2VybmVsLm9yZwpD
YzogbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKQ2M6IGxpbnV4LWZzZGV2
ZWxAdmdlci5rZXJuZWwub3JnCkNjOiBjbHVzdGVyLWRldmVsQHJlZGhhdC5jb20KQ2M6IGxpbnV4
LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBqZnMtZGlzY3Vzc2lvbkBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKQ2M6IGxpbnV4LW5mc0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IG9jZnMyLWRldmVsQG9z
cy5vcmFjbGUuY29tCkNjOiBkZXZlbEBsaXN0cy5vcmFuZ2Vmcy5vcmcKQ2M6IHJlaXNlcmZzLWRl
dmVsQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtbW1Aa3ZhY2sub3JnCkNjOiBuZXRkZXZAdmdl
ci5rZXJuZWwub3JnCkNjOiBsaW51eC1zZWN1cml0eS1tb2R1bGVAdmdlci5rZXJuZWwub3JnCkNj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnICMgNC40LCA0LjksIDQuMTQgJiA0LjE5Ci0tLQp2MTMg
LSByZWJhc2UgdG8gdXNlIF9fdmZzX2dldHhhdHRyIGZsYWdzIG9wdGlvbgoKdjEyIC0gcmViYXNl
Cgp2MTEgLSBzd2l0Y2ggbmFtZSB0byBvdmxfZG9fdmZzX2dldHhhdHRyLCBmb3J0aWZ5IGNvbW1l
bnQKCnYxMCAtIGFkZGVkIHRvIHBhdGNoIHNlcmllcwotLS0KIGZzL292ZXJsYXlmcy9uYW1laS5j
ICAgICB8IDEyICsrKysrKystLS0tLQogZnMvb3ZlcmxheWZzL292ZXJsYXlmcy5oIHwgIDIgKysK
IGZzL292ZXJsYXlmcy91dGlsLmMgICAgICB8IDI1ICsrKysrKysrKysrKysrKystLS0tLS0tLS0K
IDMgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZnMvb3ZlcmxheWZzL25hbWVpLmMgYi9mcy9vdmVybGF5ZnMvbmFtZWkuYwppbmRl
eCA5NzAyZjBkNTMwOWQuLmE0YTQ1MmM0ODlmYSAxMDA2NDQKLS0tIGEvZnMvb3ZlcmxheWZzL25h
bWVpLmMKKysrIGIvZnMvb3ZlcmxheWZzL25hbWVpLmMKQEAgLTEwNiwxMCArMTA2LDExIEBAIGlu
dCBvdmxfY2hlY2tfZmhfbGVuKHN0cnVjdCBvdmxfZmggKmZoLCBpbnQgZmhfbGVuKQogCiBzdGF0
aWMgc3RydWN0IG92bF9maCAqb3ZsX2dldF9maChzdHJ1Y3QgZGVudHJ5ICpkZW50cnksIGNvbnN0
IGNoYXIgKm5hbWUpCiB7Ci0JaW50IHJlcywgZXJyOworCXNzaXplX3QgcmVzOworCWludCBlcnI7
CiAJc3RydWN0IG92bF9maCAqZmggPSBOVUxMOwogCi0JcmVzID0gdmZzX2dldHhhdHRyKGRlbnRy
eSwgbmFtZSwgTlVMTCwgMCk7CisJcmVzID0gb3ZsX2RvX3Zmc19nZXR4YXR0cihkZW50cnksIG5h
bWUsIE5VTEwsIDApOwogCWlmIChyZXMgPCAwKSB7CiAJCWlmIChyZXMgPT0gLUVOT0RBVEEgfHwg
cmVzID09IC1FT1BOT1RTVVBQKQogCQkJcmV0dXJuIE5VTEw7CkBAIC0xMjMsNyArMTI0LDcgQEAg
c3RhdGljIHN0cnVjdCBvdmxfZmggKm92bF9nZXRfZmgoc3RydWN0IGRlbnRyeSAqZGVudHJ5LCBj
b25zdCBjaGFyICpuYW1lKQogCWlmICghZmgpCiAJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwog
Ci0JcmVzID0gdmZzX2dldHhhdHRyKGRlbnRyeSwgbmFtZSwgZmgsIHJlcyk7CisJcmVzID0gb3Zs
X2RvX3Zmc19nZXR4YXR0cihkZW50cnksIG5hbWUsIGZoLCByZXMpOwogCWlmIChyZXMgPCAwKQog
CQlnb3RvIGZhaWw7CiAKQEAgLTE0MSwxMCArMTQyLDExIEBAIHN0YXRpYyBzdHJ1Y3Qgb3ZsX2Zo
ICpvdmxfZ2V0X2ZoKHN0cnVjdCBkZW50cnkgKmRlbnRyeSwgY29uc3QgY2hhciAqbmFtZSkKIAly
ZXR1cm4gTlVMTDsKIAogZmFpbDoKLQlwcl93YXJuX3JhdGVsaW1pdGVkKCJvdmVybGF5ZnM6IGZh
aWxlZCB0byBnZXQgb3JpZ2luICglaSlcbiIsIHJlcyk7CisJcHJfd2Fybl9yYXRlbGltaXRlZCgi
b3ZlcmxheWZzOiBmYWlsZWQgdG8gZ2V0IG9yaWdpbiAoJXppKVxuIiwgcmVzKTsKIAlnb3RvIG91
dDsKIGludmFsaWQ6Ci0JcHJfd2Fybl9yYXRlbGltaXRlZCgib3ZlcmxheWZzOiBpbnZhbGlkIG9y
aWdpbiAoJSpwaE4pXG4iLCByZXMsIGZoKTsKKwlwcl93YXJuX3JhdGVsaW1pdGVkKCJvdmVybGF5
ZnM6IGludmFsaWQgb3JpZ2luICglKnBoTilcbiIsCisJCQkgICAgKGludClyZXMsIGZoKTsKIAln
b3RvIG91dDsKIH0KIApkaWZmIC0tZ2l0IGEvZnMvb3ZlcmxheWZzL292ZXJsYXlmcy5oIGIvZnMv
b3ZlcmxheWZzL292ZXJsYXlmcy5oCmluZGV4IGFiM2QwMzFjNDIyYi4uOWQyNmQ4NzU4NTEzIDEw
MDY0NAotLS0gYS9mcy9vdmVybGF5ZnMvb3ZlcmxheWZzLmgKKysrIGIvZnMvb3ZlcmxheWZzL292
ZXJsYXlmcy5oCkBAIC0yMDUsNiArMjA1LDggQEAgaW50IG92bF93YW50X3dyaXRlKHN0cnVjdCBk
ZW50cnkgKmRlbnRyeSk7CiB2b2lkIG92bF9kcm9wX3dyaXRlKHN0cnVjdCBkZW50cnkgKmRlbnRy
eSk7CiBzdHJ1Y3QgZGVudHJ5ICpvdmxfd29ya2RpcihzdHJ1Y3QgZGVudHJ5ICpkZW50cnkpOwog
Y29uc3Qgc3RydWN0IGNyZWQgKm92bF9vdmVycmlkZV9jcmVkcyhzdHJ1Y3Qgc3VwZXJfYmxvY2sg
KnNiKTsKK3NzaXplX3Qgb3ZsX2RvX3Zmc19nZXR4YXR0cihzdHJ1Y3QgZGVudHJ5ICpkZW50cnks
IGNvbnN0IGNoYXIgKm5hbWUsIHZvaWQgKmJ1ZiwKKwkJCSAgICBzaXplX3Qgc2l6ZSk7CiBzdHJ1
Y3Qgc3VwZXJfYmxvY2sgKm92bF9zYW1lX3NiKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IpOwogaW50
IG92bF9jYW5fZGVjb2RlX2ZoKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IpOwogc3RydWN0IGRlbnRy
eSAqb3ZsX2luZGV4ZGlyKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IpOwpkaWZmIC0tZ2l0IGEvZnMv
b3ZlcmxheWZzL3V0aWwuYyBiL2ZzL292ZXJsYXlmcy91dGlsLmMKaW5kZXggZjU2NzhhM2Y4MzUw
Li5jNTg4YzBkNjZkOGMgMTAwNjQ0Ci0tLSBhL2ZzL292ZXJsYXlmcy91dGlsLmMKKysrIGIvZnMv
b3ZlcmxheWZzL3V0aWwuYwpAQCAtNDAsNiArNDAsMTMgQEAgY29uc3Qgc3RydWN0IGNyZWQgKm92
bF9vdmVycmlkZV9jcmVkcyhzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiKQogCXJldHVybiBvdmVycmlk
ZV9jcmVkcyhvZnMtPmNyZWF0b3JfY3JlZCk7CiB9CiAKK3NzaXplX3Qgb3ZsX2RvX3Zmc19nZXR4
YXR0cihzdHJ1Y3QgZGVudHJ5ICpkZW50cnksIGNvbnN0IGNoYXIgKm5hbWUsIHZvaWQgKmJ1ZiwK
KwkJCSAgICBzaXplX3Qgc2l6ZSkKK3sKKwlyZXR1cm4gX192ZnNfZ2V0eGF0dHIoZGVudHJ5LCBk
X2lub2RlKGRlbnRyeSksIG5hbWUsIGJ1Ziwgc2l6ZSwKKwkJCSAgICAgIFhBVFRSX05PU0VDVVJJ
VFkpOworfQorCiBzdHJ1Y3Qgc3VwZXJfYmxvY2sgKm92bF9zYW1lX3NiKHN0cnVjdCBzdXBlcl9i
bG9jayAqc2IpCiB7CiAJc3RydWN0IG92bF9mcyAqb2ZzID0gc2ItPnNfZnNfaW5mbzsKQEAgLTUz
Nyw5ICs1NDQsOSBAQCB2b2lkIG92bF9jb3B5X3VwX2VuZChzdHJ1Y3QgZGVudHJ5ICpkZW50cnkp
CiAKIGJvb2wgb3ZsX2NoZWNrX29yaWdpbl94YXR0cihzdHJ1Y3QgZGVudHJ5ICpkZW50cnkpCiB7
Ci0JaW50IHJlczsKKwlzc2l6ZV90IHJlczsKIAotCXJlcyA9IHZmc19nZXR4YXR0cihkZW50cnks
IE9WTF9YQVRUUl9PUklHSU4sIE5VTEwsIDApOworCXJlcyA9IG92bF9kb192ZnNfZ2V0eGF0dHIo
ZGVudHJ5LCBPVkxfWEFUVFJfT1JJR0lOLCBOVUxMLCAwKTsKIAogCS8qIFplcm8gc2l6ZSB2YWx1
ZSBtZWFucyAiY29waWVkIHVwIGJ1dCBvcmlnaW4gdW5rbm93biIgKi8KIAlpZiAocmVzID49IDAp
CkBAIC01NTAsMTMgKzU1NywxMyBAQCBib29sIG92bF9jaGVja19vcmlnaW5feGF0dHIoc3RydWN0
IGRlbnRyeSAqZGVudHJ5KQogCiBib29sIG92bF9jaGVja19kaXJfeGF0dHIoc3RydWN0IGRlbnRy
eSAqZGVudHJ5LCBjb25zdCBjaGFyICpuYW1lKQogewotCWludCByZXM7CisJc3NpemVfdCByZXM7
CiAJY2hhciB2YWw7CiAKIAlpZiAoIWRfaXNfZGlyKGRlbnRyeSkpCiAJCXJldHVybiBmYWxzZTsK
IAotCXJlcyA9IHZmc19nZXR4YXR0cihkZW50cnksIG5hbWUsICZ2YWwsIDEpOworCXJlcyA9IG92
bF9kb192ZnNfZ2V0eGF0dHIoZGVudHJ5LCBuYW1lLCAmdmFsLCAxKTsKIAlpZiAocmVzID09IDEg
JiYgdmFsID09ICd5JykKIAkJcmV0dXJuIHRydWU7CiAKQEAgLTgzNywxMyArODQ0LDEzIEBAIGlu
dCBvdmxfbG9ja19yZW5hbWVfd29ya2RpcihzdHJ1Y3QgZGVudHJ5ICp3b3JrZGlyLCBzdHJ1Y3Qg
ZGVudHJ5ICp1cHBlcmRpcikKIC8qIGVyciA8IDAsIDAgaWYgbm8gbWV0YWNvcHkgeGF0dHIsIDEg
aWYgbWV0YWNvcHkgeGF0dHIgZm91bmQgKi8KIGludCBvdmxfY2hlY2tfbWV0YWNvcHlfeGF0dHIo
c3RydWN0IGRlbnRyeSAqZGVudHJ5KQogewotCWludCByZXM7CisJc3NpemVfdCByZXM7CiAKIAkv
KiBPbmx5IHJlZ3VsYXIgZmlsZXMgY2FuIGhhdmUgbWV0YWNvcHkgeGF0dHIgKi8KIAlpZiAoIVNf
SVNSRUcoZF9pbm9kZShkZW50cnkpLT5pX21vZGUpKQogCQlyZXR1cm4gMDsKIAotCXJlcyA9IHZm
c19nZXR4YXR0cihkZW50cnksIE9WTF9YQVRUUl9NRVRBQ09QWSwgTlVMTCwgMCk7CisJcmVzID0g
b3ZsX2RvX3Zmc19nZXR4YXR0cihkZW50cnksIE9WTF9YQVRUUl9NRVRBQ09QWSwgTlVMTCwgMCk7
CiAJaWYgKHJlcyA8IDApIHsKIAkJaWYgKHJlcyA9PSAtRU5PREFUQSB8fCByZXMgPT0gLUVPUE5P
VFNVUFApCiAJCQlyZXR1cm4gMDsKQEAgLTg1Miw3ICs4NTksNyBAQCBpbnQgb3ZsX2NoZWNrX21l
dGFjb3B5X3hhdHRyKHN0cnVjdCBkZW50cnkgKmRlbnRyeSkKIAogCXJldHVybiAxOwogb3V0Ogot
CXByX3dhcm5fcmF0ZWxpbWl0ZWQoIm92ZXJsYXlmczogZmFpbGVkIHRvIGdldCBtZXRhY29weSAo
JWkpXG4iLCByZXMpOworCXByX3dhcm5fcmF0ZWxpbWl0ZWQoIm92ZXJsYXlmczogZmFpbGVkIHRv
IGdldCBtZXRhY29weSAoJXppKVxuIiwgcmVzKTsKIAlyZXR1cm4gcmVzOwogfQogCkBAIC04Nzgs
NyArODg1LDcgQEAgc3NpemVfdCBvdmxfZ2V0eGF0dHIoc3RydWN0IGRlbnRyeSAqZGVudHJ5LCBj
aGFyICpuYW1lLCBjaGFyICoqdmFsdWUsCiAJc3NpemVfdCByZXM7CiAJY2hhciAqYnVmID0gTlVM
TDsKIAotCXJlcyA9IHZmc19nZXR4YXR0cihkZW50cnksIG5hbWUsIE5VTEwsIDApOworCXJlcyA9
IG92bF9kb192ZnNfZ2V0eGF0dHIoZGVudHJ5LCBuYW1lLCBOVUxMLCAwKTsKIAlpZiAocmVzIDwg
MCkgewogCQlpZiAocmVzID09IC1FTk9EQVRBIHx8IHJlcyA9PSAtRU9QTk9UU1VQUCkKIAkJCXJl
dHVybiAtRU5PREFUQTsKQEAgLTg5MCw3ICs4OTcsNyBAQCBzc2l6ZV90IG92bF9nZXR4YXR0cihz
dHJ1Y3QgZGVudHJ5ICpkZW50cnksIGNoYXIgKm5hbWUsIGNoYXIgKip2YWx1ZSwKIAkJaWYgKCFi
dWYpCiAJCQlyZXR1cm4gLUVOT01FTTsKIAotCQlyZXMgPSB2ZnNfZ2V0eGF0dHIoZGVudHJ5LCBu
YW1lLCBidWYsIHJlcyk7CisJCXJlcyA9IG92bF9kb192ZnNfZ2V0eGF0dHIoZGVudHJ5LCBuYW1l
LCBidWYsIHJlcyk7CiAJCWlmIChyZXMgPCAwKQogCQkJZ290byBmYWlsOwogCX0KLS0gCjIuMjIu
MC43NzAuZzBmMmM0YTM3ZmQtZ29vZwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
