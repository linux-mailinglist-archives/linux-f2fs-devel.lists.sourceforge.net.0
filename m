Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 425A57C951
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jul 2019 18:58:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=leRirPOLmcDLQne0hJm+Xe0wY9NSby0Xn6EUB/JdBbo=; b=E+h5SZr3hmtOXCCGz4Zi2bH7u
	igaKvjTCTGO9cHb36kkV+YKfVlhx3wDSZ2WZVDIXifeKEuTDumJ2kS8SGFSuXFIAPU54S7ONIdEzu
	5taqV14z/W0haRpChZ42Aaehx9ziuja3ZuCf4PvlJChG6xBkg41KpaI3i5HSbqO4XmCMk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hsrvs-0006RZ-UX; Wed, 31 Jul 2019 16:58:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <salyzyn@android.com>) id 1hsrvr-0006RR-HM
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Jul 2019 16:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ec+TCYltRZ+0BbWthj8J/cCYhvIm8sHJdK79dSthSdY=; b=NEzQ1WyxFApX2DHwZBqZve2ksN
 t5QynUMRBxtQMghm03AMlmUmX6hxxbGxjIOpF9ShlH293jZkyafqfkAC/fVJbhlW03sNFvhMEheIX
 CaHnzcVocx3BBPxKlUvyuV8s3agOHTBVVX0SW1EARTh4Rp9oDcxM7rlDvh17KJDeePCc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ec+TCYltRZ+0BbWthj8J/cCYhvIm8sHJdK79dSthSdY=; b=GlPo1FH5sngPBhewvde2Kz+tX4
 qCiHBrW7rJPXypxYTLGoDGbt6GpfhQzE6EREJFHJUKGMAD5dRLiand4ezHEOVyPSXcb+BnI6DhEfm
 6Y3MPmRMzs6nCckq3EUpkbnFvvm3XnJlv/RDgH70dPeJkAZU3hlzzGO01smebd9WiXkQ=;
Received: from mail-pg1-f169.google.com ([209.85.215.169])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hsrvi-005rNs-Qb
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Jul 2019 16:58:31 +0000
Received: by mail-pg1-f169.google.com with SMTP id k189so13290650pgk.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 Jul 2019 09:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ec+TCYltRZ+0BbWthj8J/cCYhvIm8sHJdK79dSthSdY=;
 b=jvJzTZBlmSeEYN+aZgAO0eQUN/Tk2RrbbnkPYld1oxWv6SRiwJlYMsrXwGgUEYUa4O
 c8IP9mSiBWfPnPUoMsfcP+avh6N+yXfmsFTOhlk/oLSPrOg61dplHWROkWXV2YCWs182
 J1E7UMPHDHumM9VHcwzfpneV57lGJ2pZrUb9g6VVDdWdrNFamw+D+bnFF2HIsMO1otBP
 QaYE36dCS32zu5Yfvc5rPyb7yUgw4D3O28kjNq/esNyy56+NllVY419E9QCcXJj+lNZ9
 n1nsl1oo8VqunmZKSa2BQZLlBHcA0KpEmN1VJDvIZg0i5KfyYr6715FMiAk9Bj8dpLw/
 L5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ec+TCYltRZ+0BbWthj8J/cCYhvIm8sHJdK79dSthSdY=;
 b=i8NJAKWbnbom0JIr7TcKqnnlDrK2FCyrJw6CgviGsSmJegM2wPMw0FS1GWY7yhZUeu
 NGCzvOaVNAp6Xw6w+VbmPoUrNbY3m6pwsLlxtTGsNqn4TrXjT9xeNBjBGTt5OWwnhd0f
 IhR/WKg2bdfbpt3fb9/fRnMj733PiO1F7BKwZdpzGN43IOhBvESaibxC5FpU8tg+Z84h
 PGyJ8Gs8s/DvNYD552mPd6Th1aHq/c7+mQR0XPFqhAl0JMCPaDb6zefeoHto8QsRaDgZ
 Yh4apUZmYgq4sCsSOokNR6TKS23VbwHsFPMCkimCKecQF03cte8d1baD6ccPBEARFB7P
 m61Q==
X-Gm-Message-State: APjAAAWN299gFJEp5aPrWRks5+iN1/R6G5y75CQ/Op6fX3Z5rpgbyulS
 TUqV43r6l9km0KwXJXg1c8U=
X-Google-Smtp-Source: APXvYqwAtm9Oi2dzrneje86zRIini04LNIAE0QYgVNa/tnC71lp2ENoOwAUjSIsPUfgwsF181KbaYg==
X-Received: by 2002:a62:6:: with SMTP id 6mr47453483pfa.159.1564592296986;
 Wed, 31 Jul 2019 09:58:16 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com
 ([2620:15c:211:200:5404:91ba:59dc:9400])
 by smtp.gmail.com with ESMTPSA id f72sm2245954pjg.10.2019.07.31.09.58.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 09:58:16 -0700 (PDT)
To: linux-kernel@vger.kernel.org
Date: Wed, 31 Jul 2019 09:57:56 -0700
Message-Id: <20190731165803.4755-2-salyzyn@android.com>
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.169 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hsrvi-005rNs-Qb
Subject: [f2fs-dev] [PATCH v13 1/5] overlayfs: check CAP_DAC_READ_SEARCH
 before issuing exportfs_decode_fh
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

QXNzdW1wdGlvbiBuZXZlciBjaGVja2VkLCBzaG91bGQgZmFpbCBpZiB0aGUgbW91bnRlciBjcmVk
cyBhcmUgbm90CnN1ZmZpY2llbnQuCgpTaWduZWQtb2ZmLWJ5OiBNYXJrIFNhbHl6eW4gPHNhbHl6
eW5AYW5kcm9pZC5jb20+CkNjOiBNaWtsb3MgU3plcmVkaSA8bWlrbG9zQHN6ZXJlZGkuaHU+CkNj
OiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PgpDYzogVml2ZWsgR295YWwgPHZnb3lh
bEByZWRoYXQuY29tPgpDYzogRXJpYyBXLiBCaWVkZXJtYW4gPGViaWVkZXJtQHhtaXNzaW9uLmNv
bT4KQ2M6IEFtaXIgR29sZHN0ZWluIDxhbWlyNzNpbEBnbWFpbC5jb20+CkNjOiBSYW5keSBEdW5s
YXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KQ2M6IFN0ZXBoZW4gU21hbGxleSA8c2RzQHR5Y2hv
Lm5zYS5nb3Y+CkNjOiBsaW51eC11bmlvbmZzQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtZG9j
QHZnZXIua2VybmVsLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpDYzoga2Vy
bmVsLXRlYW1AYW5kcm9pZC5jb20KQ2M6IEVyaWMgVmFuIEhlbnNiZXJnZW4gPGVyaWN2aEBnbWFp
bC5jb20+CkNjOiBMYXRjaGVzYXIgSW9ua292IDxsdWNob0Bpb25rb3YubmV0PgpDYzogRG9taW5p
cXVlIE1hcnRpbmV0IDxhc21hZGV1c0Bjb2Rld3JlY2sub3JnPgpDYzogRGF2aWQgSG93ZWxscyA8
ZGhvd2VsbHNAcmVkaGF0LmNvbT4KQ2M6IENocmlzIE1hc29uIDxjbG1AZmIuY29tPgpDYzogSm9z
ZWYgQmFjaWsgPGpvc2VmQHRveGljcGFuZGEuY29tPgpDYzogRGF2aWQgU3RlcmJhIDxkc3RlcmJh
QHN1c2UuY29tPgpDYzogSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4KQ2M6IFNhZ2Ug
V2VpbCA8c2FnZUByZWRoYXQuY29tPgpDYzogSWx5YSBEcnlvbW92IDxpZHJ5b21vdkBnbWFpbC5j
b20+CkNjOiBTdGV2ZSBGcmVuY2ggPHNmcmVuY2hAc2FtYmEub3JnPgpDYzogVHlsZXIgSGlja3Mg
PHR5aGlja3NAY2Fub25pY2FsLmNvbT4KQ2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY29tPgpDYzog
VGhlb2RvcmUgVHMnbyA8dHl0c29AbWl0LmVkdT4KQ2M6IEFuZHJlYXMgRGlsZ2VyIDxhZGlsZ2Vy
Lmtlcm5lbEBkaWxnZXIuY2E+CkNjOiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgpD
YzogQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPgpDYzogQm9iIFBldGVyc29uIDxycGV0ZXJz
b0ByZWRoYXQuY29tPgpDYzogQW5kcmVhcyBHcnVlbmJhY2hlciA8YWdydWVuYmFAcmVkaGF0LmNv
bT4KQ2M6IERhdmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4KQ2M6IFJpY2hhcmQg
V2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+CkNjOiBEYXZlIEtsZWlrYW1wIDxzaGFnZ3lAa2Vy
bmVsLm9yZz4KQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+CkNjOiBUZWp1biBIZW8gPHRqQGtlcm5lbC5vcmc+CkNjOiBUcm9uZCBNeWtsZWJ1c3QgPHRy
b25kLm15a2xlYnVzdEBoYW1tZXJzcGFjZS5jb20+CkNjOiBBbm5hIFNjaHVtYWtlciA8YW5uYS5z
Y2h1bWFrZXJAbmV0YXBwLmNvbT4KQ2M6IE1hcmsgRmFzaGVoIDxtYXJrQGZhc2hlaC5jb20+CkNj
OiBKb2VsIEJlY2tlciA8amxiZWNAZXZpbHBsYW4ub3JnPgpDYzogSm9zZXBoIFFpIDxqb3NlcGgu
cWlAbGludXguYWxpYmFiYS5jb20+CkNjOiBNaWtlIE1hcnNoYWxsIDxodWJjYXBAb21uaWJvbmQu
Y29tPgpDYzogTWFydGluIEJyYW5kZW5idXJnIDxtYXJ0aW5Ab21uaWJvbmQuY29tPgpDYzogQWxl
eGFuZGVyIFZpcm8gPHZpcm9AemVuaXYubGludXgub3JnLnVrPgpDYzogUGhpbGxpcCBMb3VnaGVy
IDxwaGlsbGlwQHNxdWFzaGZzLm9yZy51az4KQ2M6IERhcnJpY2sgSi4gV29uZyA8ZGFycmljay53
b25nQG9yYWNsZS5jb20+CkNjOiBsaW51eC14ZnNAdmdlci5rZXJuZWwub3JnCkNjOiBIdWdoIERp
Y2tpbnMgPGh1Z2hkQGdvb2dsZS5jb20+CkNjOiBEYXZpZCBTLiBNaWxsZXIgPGRhdmVtQGRhdmVt
bG9mdC5uZXQ+CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpD
YzogTWF0aGlldSBNYWxhdGVycmUgPG1hbGF0QGRlYmlhbi5vcmc+CkNjOiBFcm5lc3RvIEEuIEZl
cm7DoW5kZXogPGVybmVzdG8ubW5kLmZlcm5hbmRlekBnbWFpbC5jb20+CkNjOiBWeWFjaGVzbGF2
IER1YmV5a28gPHNsYXZhQGR1YmV5a28uY29tPgpDYzogdjlmcy1kZXZlbG9wZXJAbGlzdHMuc291
cmNlZm9yZ2UubmV0CkNjOiBsaW51eC1hZnNAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgt
YnRyZnNAdmdlci5rZXJuZWwub3JnCkNjOiBjZXBoLWRldmVsQHZnZXIua2VybmVsLm9yZwpDYzog
bGludXgtY2lmc0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IHNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1i
YS5vcmcKQ2M6IGVjcnlwdGZzQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtZXh0NEB2Z2VyLmtl
cm5lbC5vcmcKQ2M6IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0CkNjOiBs
aW51eC1mc2RldmVsQHZnZXIua2VybmVsLm9yZwpDYzogY2x1c3Rlci1kZXZlbEByZWRoYXQuY29t
CkNjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogamZzLWRpc2N1c3Npb25AbGlz
dHMuc291cmNlZm9yZ2UubmV0CkNjOiBsaW51eC1uZnNAdmdlci5rZXJuZWwub3JnCkNjOiBvY2Zz
Mi1kZXZlbEBvc3Mub3JhY2xlLmNvbQpDYzogZGV2ZWxAbGlzdHMub3JhbmdlZnMub3JnCkNjOiBy
ZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpDYzog
bmV0ZGV2QHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtc2VjdXJpdHktbW9kdWxlQHZnZXIua2Vy
bmVsLm9yZwpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIDQuNCwgNC45LCA0LjE0ICYgNC4x
OQotLS0KdjExICsgdjEyICsgdjEzIC0gcmViYXNlCgp2MTA6Ci0gcmV0dXJuIE5VTEwgcmF0aGVy
IHRoYW4gRVJSX1BUUigtRVBFUk0pCi0gZGlkIF9ub3RfIGFkZCBpdCBvdmxfY2FuX2RlY29kZV9m
aCgpIGJlY2F1c2Ugb2YgY2hhbmdlcyBzaW5jZSBsYXN0CiAgcmV2aWV3LCBzdXNwZWN0IG5lZWRz
IHRvIGJlIGFkZGVkIHRvIG92bF9sb3dlcl91dWlkX29rKCk/Cgp2OCArIHY5OgotIHJlYmFzZQoK
djc6Ci0gVGhpcyB0aW1lIGZvciByZWFsegoKdjY6Ci0gcmViYXNlCgp2NToKLSBkZXBlbmRlbmN5
IG9mICJvdmVybGF5ZnM6IG92ZXJyaWRlX2NyZWRzPW9mZiBvcHRpb24gYnlwYXNzIGNyZWF0b3Jf
Y3JlZCIKLS0tCiBmcy9vdmVybGF5ZnMvbmFtZWkuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZnMvb3ZlcmxheWZzL25hbWVpLmMgYi9mcy9v
dmVybGF5ZnMvbmFtZWkuYwppbmRleCBlOTcxN2MyZjdkNDUuLjk3MDJmMGQ1MzA5ZCAxMDA2NDQK
LS0tIGEvZnMvb3ZlcmxheWZzL25hbWVpLmMKKysrIGIvZnMvb3ZlcmxheWZzL25hbWVpLmMKQEAg
LTE2MSw2ICsxNjEsOSBAQCBzdHJ1Y3QgZGVudHJ5ICpvdmxfZGVjb2RlX3JlYWxfZmgoc3RydWN0
IG92bF9maCAqZmgsIHN0cnVjdCB2ZnNtb3VudCAqbW50LAogCWlmICghdXVpZF9lcXVhbCgmZmgt
PnV1aWQsICZtbnQtPm1udF9zYi0+c191dWlkKSkKIAkJcmV0dXJuIE5VTEw7CiAKKwlpZiAoIWNh
cGFibGUoQ0FQX0RBQ19SRUFEX1NFQVJDSCkpCisJCXJldHVybiBOVUxMOworCiAJYnl0ZXMgPSAo
ZmgtPmxlbiAtIG9mZnNldG9mKHN0cnVjdCBvdmxfZmgsIGZpZCkpOwogCXJlYWwgPSBleHBvcnRm
c19kZWNvZGVfZmgobW50LCAoc3RydWN0IGZpZCAqKWZoLT5maWQsCiAJCQkJICBieXRlcyA+PiAy
LCAoaW50KWZoLT50eXBlLAotLSAKMi4yMi4wLjc3MC5nMGYyYzRhMzdmZC1nb29nCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
