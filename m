Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7329B7A5AD8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Sep 2023 09:26:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qiV7q-0007LH-UP;
	Tue, 19 Sep 2023 07:26:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <xry111@linuxfromscratch.org>) id 1qiV7p-0007L7-Gp
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Sep 2023 07:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T7nfawYenRjk+4ZCMjkKSaoE2W7ZD+Q1umpTZ/cT6R4=; b=VOMIkTRBASDlXnp+ncYK4Of/oN
 Owq7G9T4UHnLeIvETdSt2diXSdQASsbqKaKsGJrN7tnRhRmcXe59bo57Dg6fIrtAx3UAmJ1guF2Ac
 rCQ973/kSOitJWuxHu9TE30Dv7s5HSz9o693FZnrYQEwV00nbPMrdY5arSp6wFUKRMKE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T7nfawYenRjk+4ZCMjkKSaoE2W7ZD+Q1umpTZ/cT6R4=; b=Re3wOmhiXZTE+e4MoSimi2S5Hi
 Eeq9/SvR5CIobDvAAbEefVd3rewIEcADAR2CCrjDfVmk1AWYLEkXrQ0I9HEjlJbVJ+ggM6XFrUDdW
 zeMl0i92UX24mnccgTvtlrBYTVQUToEF67N/jqi9asM7M3+CL3HvnC31Z8bfh7sLt52Q=;
Received: from rivendell.linuxfromscratch.org ([208.118.68.85])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qiV7o-00EGze-Oz for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Sep 2023 07:26:25 +0000
Received: from [192.168.3.211] (unknown [36.44.140.33])
 by rivendell.linuxfromscratch.org (Postfix) with ESMTPSA id 26A431C1DD6;
 Tue, 19 Sep 2023 07:05:30 +0000 (GMT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.0 at rivendell.linuxfromscratch.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfromscratch.org;
 s=cert4; t=1695107155;
 bh=9wNEeAzCOPg0mCdyHRKNEVbZmXBmTaugcI3ERiby3k0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=aqoK/Ilc8LvyUE+Xk4kK0TbIhFHarWsn2uBwrCvOIBF6xZoiA1f4tJ9dbKWFKRiu6
 paL+GBbo9SPpEBIbiWrsPB0XfpKTd2+G50VtbF86FGHEVOMJSrRDmkMaTUMORk6h/3
 qLapgrTCCQmetnyxXQd0oMfEVgIT+/HKvVoU4IKX272amD2+FjwGF7/9QSILQuggfV
 BI6kNxpQvUY/+hAogUxC35kr9T5IahyPaFtyYIDE5cZir6pdZggqKuZtpzkHOubZ1J
 isHMMtWcQM3xaSsKJn5GsqEfCinyGk71Ww3uWLHV11gy8ssXk8BO2mWnXKo2ok/N19
 WGA2g3mo4aO4w==
Message-ID: <bf0524debb976627693e12ad23690094e4514303.camel@linuxfromscratch.org>
To: Jeff Layton <jlayton@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>,  Christian Brauner <brauner@kernel.org>, Eric
 Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck
 <linux_oss@crudebyte.com>, David Howells <dhowells@redhat.com>, Marc Dionne
 <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>, Josef Bacik
 <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Xiubo Li
 <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Jan Harkes
 <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, Gao
 Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue Hu
 <huyue2@coolpad.com>,  Jeffle Xu <jefflexu@linux.alibaba.com>, Namjae Jeon
 <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara
 <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>,  Andreas Dilger
 <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA
 Hirofumi <hirofumi@mail.parknet.co.jp>, Miklos Szeredi <miklos@szeredi.hu>,
 Bob Peterson <rpeterso@redhat.com>, Andreas Gruenbacher
 <agruenba@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tejun Heo <tj@kernel.org>, Trond Myklebust
 <trond.myklebust@hammerspace.com>, Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh
 <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi
 <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin
 Brandenburg <martin@omnibond.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Kees Cook <keescook@chromium.org>, Iurii Zaikin <yzaikin@google.com>, 
 Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N
 <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Richard Weinberger <richard@nod.at>, Hans de
 Goede <hdegoede@redhat.com>, Hugh Dickins <hughd@google.com>,  Andrew
 Morton <akpm@linux-foundation.org>, Amir Goldstein <amir73il@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>, Benjamin Coddington
 <bcodding@redhat.com>
Date: Tue, 19 Sep 2023 15:05:24 +0800
In-Reply-To: <20230807-mgctime-v7-12-d1dec143a704@kernel.org>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-12-d1dec143a704@kernel.org>
User-Agent: Evolution 3.50.0 
MIME-Version: 1.0
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,RDNS_NONE,SPF_FAIL,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=ham
 autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
 rivendell.linuxfromscratch.org
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 2023-08-07 at 15:38 -0400,
 Jeff Layton wrote: > Enable
 multigrain timestamps, which should ensure that there is an > apparent change
 to the timestamp whenever it has been written after > being [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qiV7o-00EGze-Oz
Subject: Re: [f2fs-dev] [PATCH v7 12/13] ext4: switch to multigrain
 timestamps
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
From: Xi Ruoyao via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Xi Ruoyao <xry111@linuxfromscratch.org>
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, bug-gnulib@gnu.org, codalist@coda.cs.cmu.edu,
 cluster-devel@redhat.com, linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 ecryptfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCAyMDIzLTA4LTA3IGF0IDE1OjM4IC0wNDAwLCBKZWZmIExheXRvbiB3cm90ZToKPiBF
bmFibGUgbXVsdGlncmFpbiB0aW1lc3RhbXBzLCB3aGljaCBzaG91bGQgZW5zdXJlIHRoYXQgdGhl
cmUgaXMgYW4KPiBhcHBhcmVudCBjaGFuZ2UgdG8gdGhlIHRpbWVzdGFtcCB3aGVuZXZlciBpdCBo
YXMgYmVlbiB3cml0dGVuIGFmdGVyCj4gYmVpbmcgYWN0aXZlbHkgb2JzZXJ2ZWQgdmlhIGdldGF0
dHIuCj4gCj4gRm9yIGV4dDQsIHdlIG9ubHkgbmVlZCB0byBlbmFibGUgdGhlIEZTX01HVElNRSBm
bGFnLgoKSGkgSmVmZiwKClRoaXMgcGF0Y2ggY2F1c2VzIGEgZ251bGliIHRlc3QgZmFpbHVyZToK
CiQgfi9zb3VyY2VzL2xmcy9ncmVwLTMuMTEvZ251bGliLXRlc3RzL3Rlc3Qtc3RhdC10aW1lCnRl
c3Qtc3RhdC10aW1lLmM6MTQxOiBhc3NlcnRpb24gJ3N0YXRpbmZvWzBdLnN0X210aW1lIDwgc3Rh
dGluZm9bMl0uc3RfbXRpbWUgfHwgKHN0YXRpbmZvWzBdLnN0X210aW1lID09IHN0YXRpbmZvWzJd
LnN0X210aW1lICYmIChnZXRfc3RhdF9tdGltZV9ucyAoJnN0YXRpbmZvWzBdKSA8IGdldF9zdGF0
X210aW1lX25zICgmc3RhdGluZm9bMl0pKSknIGZhaWxlZApBYm9ydGVkIChjb3JlIGR1bXBlZCkK
ClRoZSBzb3VyY2UgY29kZSBvZiB0aGUgdGVzdDoKaHR0cHM6Ly9naXQuc2F2YW5uYWguZ251Lm9y
Zy9jZ2l0L2dudWxpYi5naXQvdHJlZS90ZXN0cy90ZXN0LXN0YXQtdGltZS5jCgpJcyB0aGlzIGFu
IGV4cGVjdGVkIGNoYW5nZT8KCj4gQWNrZWQtYnk6IFRoZW9kb3JlIFRzJ28gPHR5dHNvQG1pdC5l
ZHU+Cj4gUmV2aWV3ZWQtYnk6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+Cj4gU2lnbmVkLW9mZi1i
eTogSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4KPiAtLS0KPiDCoGZzL2V4dDQvc3Vw
ZXIuYyB8IDIgKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9mcy9leHQ0L3N1cGVyLmMgYi9mcy9leHQ0L3N1cGVyLmMK
PiBpbmRleCBiNTRjNzBlMWE3NGUuLmNiMWZmNDdhZjE1NiAxMDA2NDQKPiAtLS0gYS9mcy9leHQ0
L3N1cGVyLmMKPiArKysgYi9mcy9leHQ0L3N1cGVyLmMKPiBAQCAtNzI3OSw3ICs3Mjc5LDcgQEAg
c3RhdGljIHN0cnVjdCBmaWxlX3N5c3RlbV90eXBlIGV4dDRfZnNfdHlwZSA9IHsKPiDCoAkuaW5p
dF9mc19jb250ZXh0CT0gZXh0NF9pbml0X2ZzX2NvbnRleHQsCj4gwqAJLnBhcmFtZXRlcnMJCT0g
ZXh0NF9wYXJhbV9zcGVjcywKPiDCoAkua2lsbF9zYgkJPSBraWxsX2Jsb2NrX3N1cGVyLAo+IC0J
LmZzX2ZsYWdzCQk9IEZTX1JFUVVJUkVTX0RFViB8IEZTX0FMTE9XX0lETUFQLAo+ICsJLmZzX2Zs
YWdzCQk9IEZTX1JFUVVJUkVTX0RFViB8IEZTX0FMTE9XX0lETUFQIHwKPiBGU19NR1RJTUUsCj4g
wqB9Owo+IMKgTU9EVUxFX0FMSUFTX0ZTKCJleHQ0Iik7Cj4gwqAKPiAKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
