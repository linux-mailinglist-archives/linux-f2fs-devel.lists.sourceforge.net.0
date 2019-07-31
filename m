Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E4F7C94F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jul 2019 18:58:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2I9RP4Fc8CBiZOzHD/V9kymCSCHcn04e93kSOa/LfEo=; b=PDKU2B5x3DYbtFVbk8PHkJlzGa
	CtwGCRezz30uJOaTUurUjdUx3WXAmQXC7B6TY5Xksv1j0iFVsnTWoLnJ3MMI2MR8ILyAYmoIScIFW
	6JXi1gcI5V87nOJHy1VaQp9KBXTo71SbAHRkiDZp1T71zxxMyFItvUwVGOeERTdxeX0U=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hsrvi-00042d-Lp; Wed, 31 Jul 2019 16:58:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <salyzyn@android.com>) id 1hsrvh-00042W-Hw
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Jul 2019 16:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YkWr+p+vKLuVNlEdLhOL/tn/V0J5xAeOTfzwbmW2id8=; b=gAaA6/AN2PqIzK+8Nyp1f4w2IK
 q7KdX3rQBi7zDDIpFpzhzCBD/Cq0EWnNktmBp+cS807NAZl2UBZd6NEJWmoTa3AHtobY9c98p5XS7
 7AHAQn2ZZ3CMXiOx8LxwiGC91re8MfuEhoVmGaEa6kOxBdFIy34xGQDWbi2P+v+KV4x8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YkWr+p+vKLuVNlEdLhOL/tn/V0J5xAeOTfzwbmW2id8=; b=m
 AHj5QUE9IyGu7+TLzFwRPvGaTqIBtlyVKGydFQvvGkESCjva5n61H/tJS6t+6yd3G5xTJXg60aXDR
 rjC6+yWnkbMWsIZgDJS1XjCubfxTbHpZCEgw2WZJNpsWYwOhzJRAEpaf87iDoHnHqmOuhsrGHHQSM
 2Sk3qDYON3pf4C9s=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hsrvd-005Sd4-AW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Jul 2019 16:58:21 +0000
Received: by mail-pg1-f193.google.com with SMTP id u17so32335442pgi.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 Jul 2019 09:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YkWr+p+vKLuVNlEdLhOL/tn/V0J5xAeOTfzwbmW2id8=;
 b=cfX4VNn7i5fVUAJEVA4MBhomWV9u/SiICGvW/8hoXIHAFSEgly0mFbnQ+ACtuwiC3g
 IpRmu1ckKjW2mFtirOT4pZeZvT2dDPhZMzF32ZvoQFr92hPVsLC2dNO3QsACLmwar0UV
 QGuSfotvuKuTlqK5sSL0gn6Mhis1cY41gMWMYYlYUWkSVqwTLLDgqF7CYEi0YCD1g00b
 7XO/I47/oxluNGrRhfkGi6MsDix8d8wmsmYqbtCrJdMXSv2+AjyqFMUYQjA2L9of7CoM
 8oMQRrlSd8a/C7QbtWiQIXkLjDxq+jhIt0VkS66EI4A6SO7z2CwCPG6R7kaiAWc0Io97
 PoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YkWr+p+vKLuVNlEdLhOL/tn/V0J5xAeOTfzwbmW2id8=;
 b=GVJ8dttWaC4+VExu76znVKFYg1r9T1LOEog2xLqB0BlGnrbxHsWqXl0I1jqQIo6XwT
 O32IJiHmmnLrlnwG/p9GivUltVALWZ26/Ya6mIv6lN5TOLcuCFBEuqg6kZwcOaylMBAc
 B5xBLgiX1qfm6fLdelmuitDIZmODAKddt8qUpx8h4HsEbf8ZqJcA9ialb77gisqs9hJb
 aGoRS/LSW8lTUf3kh/ybt2XwB3+o+Yrb3cLJPiGZfJQiHnyvqe/QzUjC9vc5xB48Fnrg
 eSzk8m1Smy7nmp3uOvITFW+83oVbhJ5LnaTksJTbYLhkBjmqTILty7r19jU+ZDssLiOt
 EuQw==
X-Gm-Message-State: APjAAAXMVf9Vaypg/4JhZK4v+O/4uAoESjPfFImsCQqlXjyQfiz69sLY
 nu6GJd1+pIvohMSUqJ3uUlc=
X-Google-Smtp-Source: APXvYqy8vRIpYoYhq+l1XHKOf/Pp65RQkYrvXTYdFcAiznSLIUoJDMNElyzOyLh9v1G4MbxuSIIkEQ==
X-Received: by 2002:a17:90a:2041:: with SMTP id
 n59mr3794829pjc.6.1564592291310; 
 Wed, 31 Jul 2019 09:58:11 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com
 ([2620:15c:211:200:5404:91ba:59dc:9400])
 by smtp.gmail.com with ESMTPSA id f72sm2245954pjg.10.2019.07.31.09.58.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 09:58:10 -0700 (PDT)
To: linux-kernel@vger.kernel.org
Date: Wed, 31 Jul 2019 09:57:55 -0700
Message-Id: <20190731165803.4755-1-salyzyn@android.com>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fasheh.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hsrvd-005Sd4-AW
Subject: [f2fs-dev] [PATCH v13 0/5] overlayfs override_creds=off
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

UGF0Y2ggc2VyaWVzOgoKb3ZlcmxheWZzOiBjaGVjayBDQVBfREFDX1JFQURfU0VBUkNIIGJlZm9y
ZSBpc3N1aW5nIGV4cG9ydGZzX2RlY29kZV9maApBZGQgZmxhZ3Mgb3B0aW9uIHRvIGdldCB4YXR0
ciBtZXRob2QgcGFpcmVkIHRvIF9fdmZzX2dldHhhdHRyCm92ZXJsYXlmczogaGFuZGxlIFhBVFRS
X05PU0VDVVJJVFkgZmxhZyBmb3IgZ2V0IHhhdHRyIG1ldGhvZApvdmVybGF5ZnM6IGludGVybmFs
IGdldHhhdHRyIG9wZXJhdGlvbnMgd2l0aG91dCBzZXBvbGljeSBjaGVja2luZwpvdmVybGF5ZnM6
IG92ZXJyaWRlX2NyZWRzPW9mZiBvcHRpb24gYnlwYXNzIGNyZWF0b3JfY3JlZAoKVGhlIGZpcnN0
IGZvdXIgcGF0Y2hlcyBhZGRyZXNzIGZ1bmRhbWVudGFsIHNlY3VyaXR5IGlzc3VlcyB0aGF0IHNo
b3VsZApiZSBzb2x2ZWQgcmVnYXJkbGVzcyBvZiB0aGUgb3ZlcnJpZGVfY3JlZHM9b2ZmIGZlYXR1
cmUuCm9uIHRoZW0pLgoKVGhlIGZpZnRoIGFkZHMgdGhlIGZlYXR1cmUgZGVwZW5kcyBvbiB0aGVz
ZSBvdGhlciBmaXhlcy4KCkJ5IGRlZmF1bHQsIGFsbCBhY2Nlc3MgdG8gdGhlIHVwcGVyLCBsb3dl
ciBhbmQgd29yayBkaXJlY3RvcmllcyBpcyB0aGUKcmVjb3JkZWQgbW91bnRlcidzIE1BQyBhbmQg
REFDIGNyZWRlbnRpYWxzLiAgVGhlIGluY29taW5nIGFjY2Vzc2VzIGFyZQpjaGVja2VkIGFnYWlu
c3QgdGhlIGNhbGxlcidzIGNyZWRlbnRpYWxzLgoKSWYgdGhlIHByaW5jaXBsZXMgb2YgbGVhc3Qg
cHJpdmlsZWdlIGFyZSBhcHBsaWVkIGZvciBzZXBvbGljeSwgdGhlCm1vdW50ZXIncyBjcmVkZW50
aWFscyBtaWdodCBub3Qgb3ZlcmxhcCB0aGUgY3JlZGVudGlhbHMgb2YgdGhlIGNhbGxlcidzCndo
ZW4gYWNjZXNzaW5nIHRoZSBvdmVybGF5ZnMgZmlsZXN5c3RlbS4gIEZvciBleGFtcGxlLCBhIGZp
bGUgdGhhdCBhCmxvd2VyIERBQyBwcml2aWxlZ2VkIGNhbGxlciBjYW4gZXhlY3V0ZSwgaXMgTUFD
IGRlbmllZCB0byB0aGUKZ2VuZXJhbGx5IGhpZ2hlciBEQUMgcHJpdmlsZWdlZCBtb3VudGVyLCB0
byBwcmV2ZW50IGFuIGF0dGFjayB2ZWN0b3IuCgpXZSBhZGQgdGhlIG9wdGlvbiB0byB0dXJuIG9m
ZiBvdmVycmlkZV9jcmVkcyBpbiB0aGUgbW91bnQgb3B0aW9uczsgYWxsCnN1YnNlcXVlbnQgb3Bl
cmF0aW9ucyBhZnRlciBtb3VudCBvbiB0aGUgZmlsZXN5c3RlbSB3aWxsIGJlIG9ubHkgdGhlCmNh
bGxlcidzIGNyZWRlbnRpYWxzLiAgVGhlIG1vZHVsZSBib29sZWFuIHBhcmFtZXRlciBhbmQgbW91
bnQgb3B0aW9uCm92ZXJyaWRlX2NyZWRzIGlzIGFsc28gYWRkZWQgYXMgYSBwcmVzZW5jZSBjaGVj
ayBmb3IgdGhpcyAiZmVhdHVyZSIsCmV4aXN0ZW5jZSBvZiAvc3lzL21vZHVsZS9vdmVybGF5L3Bh
cmFtZXRlcnMvb3ZlcmxheV9jcmVkcwoKU2lnbmVkLW9mZi1ieTogTWFyayBTYWx5enluIDxzYWx5
enluQGFuZHJvaWQuY29tPgpDYzogTWlrbG9zIFN6ZXJlZGkgPG1pa2xvc0BzemVyZWRpLmh1PgpD
YzogSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD4KQ2M6IFZpdmVrIEdveWFsIDx2Z295
YWxAcmVkaGF0LmNvbT4KQ2M6IEVyaWMgVy4gQmllZGVybWFuIDxlYmllZGVybUB4bWlzc2lvbi5j
b20+CkNjOiBBbWlyIEdvbGRzdGVpbiA8YW1pcjczaWxAZ21haWwuY29tPgpDYzogUmFuZHkgRHVu
bGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+CkNjOiBTdGVwaGVuIFNtYWxsZXkgPHNkc0B0eWNo
by5uc2EuZ292PgpDYzogbGludXgtdW5pb25mc0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LWRv
Y0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKQ2M6IEVy
aWMgVmFuIEhlbnNiZXJnZW4gPGVyaWN2aEBnbWFpbC5jb20+CkNjOiBMYXRjaGVzYXIgSW9ua292
IDxsdWNob0Bpb25rb3YubmV0PgpDYzogRG9taW5pcXVlIE1hcnRpbmV0IDxhc21hZGV1c0Bjb2Rl
d3JlY2sub3JnPgpDYzogRGF2aWQgSG93ZWxscyA8ZGhvd2VsbHNAcmVkaGF0LmNvbT4KQ2M6IENo
cmlzIE1hc29uIDxjbG1AZmIuY29tPgpDYzogSm9zZWYgQmFjaWsgPGpvc2VmQHRveGljcGFuZGEu
Y29tPgpDYzogRGF2aWQgU3RlcmJhIDxkc3RlcmJhQHN1c2UuY29tPgpDYzogSmVmZiBMYXl0b24g
PGpsYXl0b25Aa2VybmVsLm9yZz4KQ2M6IFNhZ2UgV2VpbCA8c2FnZUByZWRoYXQuY29tPgpDYzog
SWx5YSBEcnlvbW92IDxpZHJ5b21vdkBnbWFpbC5jb20+CkNjOiBTdGV2ZSBGcmVuY2ggPHNmcmVu
Y2hAc2FtYmEub3JnPgpDYzogVHlsZXIgSGlja3MgPHR5aGlja3NAY2Fub25pY2FsLmNvbT4KQ2M6
IEphbiBLYXJhIDxqYWNrQHN1c2UuY29tPgpDYzogVGhlb2RvcmUgVHMnbyA8dHl0c29AbWl0LmVk
dT4KQ2M6IEFuZHJlYXMgRGlsZ2VyIDxhZGlsZ2VyLmtlcm5lbEBkaWxnZXIuY2E+CkNjOiBKYWVn
ZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgpDYzogQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWku
Y29tPgpDYzogQm9iIFBldGVyc29uIDxycGV0ZXJzb0ByZWRoYXQuY29tPgpDYzogQW5kcmVhcyBH
cnVlbmJhY2hlciA8YWdydWVuYmFAcmVkaGF0LmNvbT4KQ2M6IERhdmlkIFdvb2Rob3VzZSA8ZHdt
dzJAaW5mcmFkZWFkLm9yZz4KQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+
CkNjOiBEYXZlIEtsZWlrYW1wIDxzaGFnZ3lAa2VybmVsLm9yZz4KQ2M6IEdyZWcgS3JvYWgtSGFy
dG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+CkNjOiBUZWp1biBIZW8gPHRqQGtlcm5l
bC5vcmc+CkNjOiBUcm9uZCBNeWtsZWJ1c3QgPHRyb25kLm15a2xlYnVzdEBoYW1tZXJzcGFjZS5j
b20+CkNjOiBBbm5hIFNjaHVtYWtlciA8YW5uYS5zY2h1bWFrZXJAbmV0YXBwLmNvbT4KQ2M6IE1h
cmsgRmFzaGVoIDxtYXJrQGZhc2hlaC5jb20+CkNjOiBKb2VsIEJlY2tlciA8amxiZWNAZXZpbHBs
YW4ub3JnPgpDYzogSm9zZXBoIFFpIDxqb3NlcGgucWlAbGludXguYWxpYmFiYS5jb20+CkNjOiBN
aWtlIE1hcnNoYWxsIDxodWJjYXBAb21uaWJvbmQuY29tPgpDYzogTWFydGluIEJyYW5kZW5idXJn
IDxtYXJ0aW5Ab21uaWJvbmQuY29tPgpDYzogQWxleGFuZGVyIFZpcm8gPHZpcm9AemVuaXYubGlu
dXgub3JnLnVrPgpDYzogUGhpbGxpcCBMb3VnaGVyIDxwaGlsbGlwQHNxdWFzaGZzLm9yZy51az4K
Q2M6IERhcnJpY2sgSi4gV29uZyA8ZGFycmljay53b25nQG9yYWNsZS5jb20+CkNjOiBsaW51eC14
ZnNAdmdlci5rZXJuZWwub3JnCkNjOiBIdWdoIERpY2tpbnMgPGh1Z2hkQGdvb2dsZS5jb20+CkNj
OiBEYXZpZCBTLiBNaWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+CkNjOiBBbmRyZXcgTW9ydG9u
IDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogTWF0aGlldSBNYWxhdGVycmUgPG1hbGF0
QGRlYmlhbi5vcmc+CkNjOiBFcm5lc3RvIEEuIEZlcm7DoW5kZXogPGVybmVzdG8ubW5kLmZlcm5h
bmRlekBnbWFpbC5jb20+CkNjOiBWeWFjaGVzbGF2IER1YmV5a28gPHNsYXZhQGR1YmV5a28uY29t
PgpDYzogdjlmcy1kZXZlbG9wZXJAbGlzdHMuc291cmNlZm9yZ2UubmV0CkNjOiBsaW51eC1hZnNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtYnRyZnNAdmdlci5rZXJuZWwub3JnCkNjOiBj
ZXBoLWRldmVsQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtY2lmc0B2Z2VyLmtlcm5lbC5vcmcK
Q2M6IHNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1iYS5vcmcKQ2M6IGVjcnlwdGZzQHZnZXIua2Vy
bmVsLm9yZwpDYzogbGludXgtZXh0NEB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0CkNjOiBsaW51eC1mc2RldmVsQHZnZXIua2VybmVsLm9y
ZwpDYzogY2x1c3Rlci1kZXZlbEByZWRoYXQuY29tCkNjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpDYzogamZzLWRpc2N1c3Npb25AbGlzdHMuc291cmNlZm9yZ2UubmV0CkNjOiBsaW51
eC1uZnNAdmdlci5rZXJuZWwub3JnCkNjOiBvY2ZzMi1kZXZlbEBvc3Mub3JhY2xlLmNvbQpDYzog
ZGV2ZWxAbGlzdHMub3JhbmdlZnMub3JnCkNjOiByZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5v
cmcKQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpDYzogbmV0ZGV2QHZnZXIua2VybmVsLm9yZwpDYzog
bGludXgtc2VjdXJpdHktbW9kdWxlQHZnZXIua2VybmVsLm9yZwpDYzogc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZyAjIDQuNCwgNC45LCA0LjE0ICYgNC4xOQotLS0KdjEzOgotIGFkZCBmbGFncyBhcmd1
bWVudCB0byBfX3Zmc19nZXR4YXR0cgotIGRyb3AgR0ZQX05PRlMgc2lkZS1lZmZlY3QKCnYxMjoK
LSBSZXN0b3JlIHNxdWlzaGVkIG91dCBwYXRjaCAyIGFuZCAzIGluIHRoZSBzZXJpZXMsCiAgdGhl
biBjaGFuZ2UgYWxnb3JpdGhtIHRvIGFkZCBmbGFncyBhcmd1bWVudC4KICBQZXItdGhyZWFkIGZs
YWcgaXMgYSBsYXJnZSBzZWN1cml0eSBzdXJmYWNlLgoKdjExOgotIFNxdWlzaCBvdXQgdjEwIGlu
dHJvZHVjZWQgcGF0Y2ggMiBhbmQgMyBpbiB0aGUgc2VyaWVzLAogIHRoZW4gYW5kIHVzZSBwZXIt
dGhyZWFkIGZsYWcgaW5zdGVhZCBmb3IgbmVzdGluZy4KLSBTd2l0Y2ggbmFtZSB0byBvdmxfZG9f
dmRzX2dldHhhdHRyIGZvciBfX3Zkc19nZXR4YXR0ciB3cmFwcGVyLgotIEFkZCBzYiBhcmd1bWVu
dCB0byBvdmxfcmV2ZXJ0X2NyZWRzIHRvIG1hdGNoIGZ1dHVyZSB3b3JrLgoKdjEwOgotIFJldHVy
biBOVUxMIG9uIENBUF9EQUNfUkVBRF9TRUFSQ0gKLSBBZGQgX19nZXQgeGF0dHIgbWV0aG9kIHRv
IHNvbHZlIHNlcG9saWN5IGxvZ2dpbmcgaXNzdWUKLSBEcm9wIHVubmVjZXNzYXJ5IHN5c19hZG1p
biBzZXBvbGljeSBjaGVja2luZyBmb3IgYWRtaW5pc3RyYXRpdmUKICBkcml2ZXIgaW50ZXJuYWwg
eGF0dHIgZnVuY3Rpb25zLgoKdjY6Ci0gRHJvcCBDT05GSUdfT1ZFUkxBWV9GU19PVkVSUklERV9D
UkVEUy4KLSBEbyBiZXR0ZXIgd2l0aCB0aGUgZG9jdW1lbnRhdGlvbiwgZHJvcCByYXRpb25hbGl6
YXRpb25zLgotIHByX3dhcm4gbWVzc2FnZSBhZGp1c3RlZCB0byByZXBvcnQgY29uc2VxdWVuY2Vz
LgoKdjU6Ci0gYmVlZmVkIHVwIHRoZSBjYXZlYXRzIGluIHRoZSBEb2N1bWVudGF0aW9uCi0gSXMg
ZGVwZW5kZW50IG9uCiAgIm92ZXJsYXlmczogY2hlY2sgQ0FQX0RBQ19SRUFEX1NFQVJDSCBiZWZv
cmUgaXNzdWluZyBleHBvcnRmc19kZWNvZGVfZmgiCiAgIm92ZXJsYXlmczogY2hlY2sgQ0FQX01L
Tk9EIGJlZm9yZSBpc3N1aW5nIHZmc193aGl0ZW91dCIKLSBBZGRlZCBwcndhcm4gd2hlbiBvdmVy
cmlkZV9jcmVkcz1vZmYKCnY0OgotIHNwZWxsaW5nIGFuZCBncmFtbWFyIGVycm9ycyBpbiB0ZXh0
Cgp2MzoKLSBDaGFuZ2UgbmFtZSBmcm9tIGNhbGxlcl9jcmVkZW50aWFscyAvIGNyZWF0b3JfY3Jl
ZGVudGlhbHMgdG8gdGhlCiAgYm9vbGVhbiBvdmVycmlkZV9jcmVkcy4KLSBDaGFuZ2VkIGZyb20g
Y3JlYXRvciB0byBtb3VudGVyIGNyZWRlbnRpYWxzLgotIFVwZGF0ZWQgYW5kIGZvcnRpZmllZCB0
aGUgZG9jdW1lbnRhdGlvbi4KLSBBZGRlZCBDT05GSUdfT1ZFUkxBWV9GU19PVkVSUklERV9DUkVE
UwoKdjI6Ci0gRm9yd2FyZCBwb3J0IGNoYW5nZWQgYXR0ciB0byBzdGF0LCByZXN1bHRpbmcgaW4g
YSBidWlsZCBlcnJvci4KLSBhbHRlcmVkIGNvbW1pdCBtZXNzYWdlLgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
