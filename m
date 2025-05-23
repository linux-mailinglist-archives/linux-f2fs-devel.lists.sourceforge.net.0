Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32079AC19BE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 May 2025 03:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKRuU9CoM5QrFRDmBDQhbJC03olc38D+fcBAwCb7G/E=; b=ISCNkvqP2Fz8srhoPEVi2/I43E
	MyXqbDB+pUXqYvQBp3Hm0UmDGVkjO70tlbk8Zee0pLjQREFci6wei50cozCu+r9P9Azg1lUtcQnHs
	cqFJ5OoU2SJLuCxy/v18EmFgyiGc42yZYhFAQzpJiO1S3tk9HW6H/KcoC92USJ5xp+5s=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uIHOB-0000j0-H5;
	Fri, 23 May 2025 01:39:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1uIHNw-0000ih-Qy
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 01:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+g5V9tAyig6HI/i/tRhLAzkeAnoyfZecTy+ex1U9OrM=; b=DOciPqr3tFb/z0hLpgxurJGW4l
 K1oU9jbTgl4xYsjG3vc0EbNp8+sgpXuwJ5MQ+URhxB91YATaCOFhhGvnMOhZHK7AvIOAqn7aMTSq8
 gooeubYJrP5qvyJsB2MJJAtxwfPS9sdDxJTrK/dGCDjSZZzsLxK5OHQtiw3B+5acvcXU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+g5V9tAyig6HI/i/tRhLAzkeAnoyfZecTy+ex1U9OrM=; b=FNZpVIgmevBvIk4NjSGEgJye1L
 FpWJnvlzOlkHkdZ7i5lg9qOh6QJV87UubUhW8m3ShuDAzPKs01MexW9mrwKVrUFIb1hYdylImkcYy
 5cuDlNsfqsrGwjTlyK2cus/0XJu2Ub0REoLY7VmVr/wrzaA22we3BHpqjcffT8S8RahY=;
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uIHNw-00082g-As for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 01:39:44 +0000
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a35ae46214so857482f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 May 2025 18:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747964373; x=1748569173; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+g5V9tAyig6HI/i/tRhLAzkeAnoyfZecTy+ex1U9OrM=;
 b=geYEM5OrDV+TR3FMD36Fkj0Zo2Ufh7QeqEO1gyoiyUKGn//C9vBukf0MYti+rMa9ql
 9MX+N0V2+gAYZrznzISquqIz2V1nW0EqsiBFsffC3d6jrlWzKiKIpGi2bAV0qpP+Y7sN
 aHploOcfWGE0Sv8lVLB6rJQCtQhKQOlb2LWpSfIc4hITGGHc/Ta+dBP6jQfMeuSFusCs
 BLuhYUPO7QTZYOVeTVikNWx5h0pqAL+GdOeHdE/rYMOf8od8cTfJrVAVmkYGE/qvtWz5
 TYWdas2k9AdiIJFMCxCVSrm7GBgZ+0mCLtlHmG0guJ4L2oxFeAaOEhIpPiA3IwZc2xmw
 NNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747964373; x=1748569173;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+g5V9tAyig6HI/i/tRhLAzkeAnoyfZecTy+ex1U9OrM=;
 b=fmZ7wUYv5BDP83zYIzL5EzPEXMyVp/gBR4b6ul1VWPGww+Izyu8tJqTBBIK3mmJOCp
 3wuFbVf9N8ypevyc2dmvXejqcXe2a1v9/KDUvzn2hBM8VktLkCC229+dLrXUk2os91RC
 sS8tvg6RX7lG8EdeILaQ3AUmFfFng04GCKvtfM0QNd1ZUVwDSdK0OWxA2/D7FsRWKAVF
 IWMvqDWANLX+XJviJiHLBBm3ZT2xYPSe3nPFTaoPSlRtOlRJfNbS8/Jh4zUBWXe/G/+C
 Foc9vHhU5qm5l0PnyVrBnljaRbhtCj0kVVFjlb4OmAnfCGswYtvOBpNKc/bzsdSyAf5T
 T81w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb4h7B4i+zsHUrXZSMUG6q5RV077qPeXsJiTNDah8HF2EWalsohopk0iau4ig1kp7EsaU5Mgfza2wXZXZv9zEb@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw3tRtdxcnY7ZLg0rlH7aM7l4plZDsy+eB7ps4bAIQ4p6NzUq82
 568MDvNl+7muaVrgAij1UnHRtE+ri1q8+lpd27ZClvj1fZtydG0m8zb/68pFrc8jvLXlyIKkfOn
 3cOkUVH0SEvmvKMBKFMw4InXW9nlJq+g=
X-Gm-Gg: ASbGncskPZ+xtJboiOqI7nTxjXQNoyvL6qAgOnKfqBlGoiwQfAWUU3W5eA1CNTMyKQ/
 8XJqhj2uprDzbN6ECjS2f8WOBZRecZ5vqbZYKDs1QQNZifqxnv2lcAe4pbolpfYKCAt9YDfzQbJ
 VqL0Dyg/BqSLhD+881oNN+BoOn0XLsz1BnjA==
X-Google-Smtp-Source: AGHT+IFn5VlX2x+YOnwSuaERMnEdXbA0mh6MF1d5tUr0x7cCS6P9dtLC+f2hMvCPr3qzJvc+zfD0iwuhkxAbgG0/mNo=
X-Received: by 2002:a5d:64cb:0:b0:3a3:6ab0:8863 with SMTP id
 ffacd0b85a97d-3a36ab089b0mr6439541f8f.16.1747964372704; Thu, 22 May 2025
 18:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250521115635.829744-1-chao@kernel.org>
In-Reply-To: <20250521115635.829744-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 23 May 2025 09:39:21 +0800
X-Gm-Features: AX0GCFu_rZ5QZoXdxMeB6B3Dsd7sOUL2vHTMib5OtRC-a0lpjVZ5PG13BL8-YCo
Message-ID: <CAHJ8P3J8cX5+pVkE4TT24zh+wvW06KrpKXT2-7cRx3i8XzBbNw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2025年5月21日周三 20:02写道：
    > > INFO: task syz-executor328:5856 blocked for more than 144 seconds. >
   Not tainted 6.15.0-rc6-syzkaller-00208-g3c21441eeffc #0 [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.221.53 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
                             trust
                             [209.85.221.53 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.53 listed in wl.mailspike.net]
X-Headers-End: 1uIHNw-00082g-As
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to skip f2fs_balance_fs() if
 checkpoint is disabled
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
Cc: syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com, jaegeuk@kernel.org,
 Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjXlubQ15pyIMjHml6XlkajkuIkgMjA6MDLlhpnpgZPvvJoKPgo+
IElORk86IHRhc2sgc3l6LWV4ZWN1dG9yMzI4OjU4NTYgYmxvY2tlZCBmb3IgbW9yZSB0aGFuIDE0
NCBzZWNvbmRzLgo+ICAgICAgIE5vdCB0YWludGVkIDYuMTUuMC1yYzYtc3l6a2FsbGVyLTAwMjA4
LWczYzIxNDQxZWVmZmMgIzAKPiAiZWNobyAwID4gL3Byb2Mvc3lzL2tlcm5lbC9odW5nX3Rhc2tf
dGltZW91dF9zZWNzIiBkaXNhYmxlcyB0aGlzIG1lc3NhZ2UuCj4gdGFzazpzeXotZXhlY3V0b3Iz
Mjggc3RhdGU6RCBzdGFjazoyNDM5MiBwaWQ6NTg1NiAgdGdpZDo1ODMyICBwcGlkOjU4MjYgICB0
YXNrX2ZsYWdzOjB4NDAwMDQwIGZsYWdzOjB4MDAwMDQwMDYKPiBDYWxsIFRyYWNlOgo+ICA8VEFT
Sz4KPiAgY29udGV4dF9zd2l0Y2gga2VybmVsL3NjaGVkL2NvcmUuYzo1MzgyIFtpbmxpbmVdCj4g
IF9fc2NoZWR1bGUrMHgxNjhmLzB4NGM3MCBrZXJuZWwvc2NoZWQvY29yZS5jOjY3NjcKPiAgX19z
Y2hlZHVsZV9sb29wIGtlcm5lbC9zY2hlZC9jb3JlLmM6Njg0NSBbaW5saW5lXQo+ICBzY2hlZHVs
ZSsweDE2NS8weDM2MCBrZXJuZWwvc2NoZWQvY29yZS5jOjY4NjAKPiAgaW9fc2NoZWR1bGUrMHg4
MS8weGUwIGtlcm5lbC9zY2hlZC9jb3JlLmM6Nzc0Mgo+ICBmMmZzX2JhbGFuY2VfZnMrMHg0YjQv
MHg3ODAgZnMvZjJmcy9zZWdtZW50LmM6NDQ0Cj4gIGYyZnNfbWFwX2Jsb2NrcysweDNhZjEvMHg0
M2IwIGZzL2YyZnMvZGF0YS5jOjE3OTEKPiAgZjJmc19leHBhbmRfaW5vZGVfZGF0YSsweDY1My8w
eGFmMCBmcy9mMmZzL2ZpbGUuYzoxODcyCj4gIGYyZnNfZmFsbG9jYXRlKzB4NGY1LzB4OTkwIGZz
L2YyZnMvZmlsZS5jOjE5NzUKPiAgdmZzX2ZhbGxvY2F0ZSsweDZhMC8weDgzMCBmcy9vcGVuLmM6
MzM4Cj4gIGlvY3RsX3ByZWFsbG9jYXRlIGZzL2lvY3RsLmM6MjkwIFtpbmxpbmVdCj4gIGZpbGVf
aW9jdGwgZnMvaW9jdGwuYzotMSBbaW5saW5lXQo+ICBkb192ZnNfaW9jdGwrMHgxYjhmLzB4MWVi
MCBmcy9pb2N0bC5jOjg4NQo+ICBfX2RvX3N5c19pb2N0bCBmcy9pb2N0bC5jOjkwNCBbaW5saW5l
XQo+ICBfX3NlX3N5c19pb2N0bCsweDgyLzB4MTcwIGZzL2lvY3RsLmM6ODkyCj4gIGRvX3N5c2Nh
bGxfeDY0IGFyY2gveDg2L2VudHJ5L3N5c2NhbGxfNjQuYzo2MyBbaW5saW5lXQo+ICBkb19zeXNj
YWxsXzY0KzB4ZjYvMHgyMTAgYXJjaC94ODYvZW50cnkvc3lzY2FsbF82NC5jOjk0Cj4gIGVudHJ5
X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc3LzB4N2YKPgo+IFRoZSByb290IGNhdXNlIGlz
IGFmdGVyIGNvbW1pdCA4NGI1YmI4YmYwZjYgKCJmMmZzOiBtb2RpZnkKPiBmMmZzX2lzX2NoZWNr
cG9pbnRfcmVhZHkgbG9naWMgdG8gYWxsb3cgbW9yZSBkYXRhIHRvIGJlIHdyaXR0ZW4gd2l0aCB0
aGUKPiBDUCBkaXNhYmxlIiksIHdlIHdpbGwgZ2V0IGNoYW5jZSB0byBhbGxvdyBmMmZzX2lzX2No
ZWNrcG9pbnRfcmVhZHkoKSB0bwo+IHJldHVybiB0cnVlIG9uY2UgYmVsb3cgY29uZGl0aW9ucyBh
cmUgYWxsIHRydWU6Cj4gMS4gY2hlY2twb2ludCBpcyBkaXNhYmxlZAo+IDIuIHRoZXJlIGFyZSBu
b3QgZW5vdWdoIGZyZWUgc2VnbWVudHMKPiAzLiB0aGVyZSBhcmUgZW5vdWdoIGZyZWUgYmxvY2tz
Cj4KPiBUaGVuIGl0IHdpbGwgY2F1c2UgZjJmc19iYWxhbmNlX2ZzKCkgdG8gdHJpZ2dlciBmb3Jl
Z3JvdW5kIEdDLgo+Cj4gdm9pZCBmMmZzX2JhbGFuY2VfZnMoc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpLCBib29sIG5lZWQpCj4gLi4uCj4gICAgICAgICBpZiAoIWYyZnNfaXNfY2hlY2twb2ludF9y
ZWFkeShzYmkpKQo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4KPiBBbmQgaXQgbW91bnRzIGYy
ZnMgaW1hZ2Ugdy8gZ2NfbWVyZ2UsY2hlY2twb2ludD1kaXNhYmxlLCBzbyBiZWxvdyBkZWFkbG9v
cAo+IHdpbGwgaGFwcGVuOgo+Cj4gLSBmMmZzX2RvX3NodXRkb3duICAgICAgICAgICAgICAtIHZm
c19mYWxsb2NhdGUgICAgICAgICAgICAgICAgICAgICAgICAgLSBnY190aHJlYWRfZnVuYwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gZmlsZV9zdGFydF93cml0ZQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIF9fc2Jfc3RhcnRfd3JpdGUoU0JfRlJFRVpF
X1dSSVRFKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gZjJmc19mYWxsb2Nh
dGUKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBmMmZzX2V4cGFuZF9pbm9k
ZV9kYXRhCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNfbWFwX2Js
b2Nrcwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gZjJmc19iYWxhbmNl
X2ZzCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gcHJlcGFyZV90b193
YWl0Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gd2FrZV91cChnY193
YWl0X3F1ZXVlX2hlYWQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0g
aW9fc2NoZWR1bGUKPiAgLSBiZGV2X2ZyZWV6ZQo+ICAgLSBmcmVlemVfc3VwZXIKPiAgICAtIHNi
LT5zX3dyaXRlcnMuZnJvemVuID0gU0JfRlJFRVpFX1dSSVRFOwo+ICAgIC0gc2Jfd2FpdF93cml0
ZShzYiwgU0JfRlJFRVpFX1dSSVRFKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBpZiAoc2JpLT5zYi0+
c193cml0ZXJzLmZyb3plbiA+PSBTQl9GUkVFWkVfV1JJVEUpIGNvbnRpbnVlOwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA6IGNhdXNlIGRlYWRsb29wCj4KPiBUaGlzIHBhdGNoIGZpeCB0byBhZGQgY2hlY2sg
Y29uZGl0aW9uIGluIGYyZnNfYmFsYW5jZV9mcygpLCBzbyB0aGF0IGlmCj4gY2hlY2twb2ludCBp
cyBkaXNhYmxlZCwgd2Ugd2lsbCBqdXN0IHNraXAgdHJpZ2dlciBmb3JlZ3JvdW5kIEdDIHRvCj4g
YXZvaWQgYWJvdmUgZGVhZGxvb3AgaXNzdWUuCj4KPiBSZXBvcnRlZC1ieTogc3l6Ym90K2FhNWJi
NWY2ODYwZTA4YTYwNDUwQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KPiBDbG9zZXM6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvNjgyZDc0M2EuYTAwYTAyMjAuMjli
YzI2LjAyODkuR0FFQGdvb2dsZS5jb20KPiBGaXhlczogODRiNWJiOGJmMGY2ICgiZjJmczogbW9k
aWZ5IGYyZnNfaXNfY2hlY2twb2ludF9yZWFkeSBsb2dpYyB0byBhbGxvdyBtb3JlIGRhdGEgdG8g
YmUgd3JpdHRlbiB3aXRoIHRoZSBDUCBkaXNhYmxlIikKPiBDYzogUWkgSGFuIDxoYW5xaUB2aXZv
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4gLS0tCj4g
djI6Cj4gLSBhZGQgbWlzc2luZyBDbG9zZXMgbGluZQo+IC0gZml4IHRvIHVzZSBnaXQgY29tbWl0
IGRlc2NyaXB0aW9uIHN0eWxlCj4KPiAgZnMvZjJmcy9zZWdtZW50LmMgfCAyICsrCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21l
bnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gaW5kZXggNWZmMDExMWVkOTc0Li4xOWI3MTZmZGE3
MmEgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPiArKysgYi9mcy9mMmZzL3NlZ21l
bnQuYwo+IEBAIC00MzMsNiArNDMzLDggQEAgdm9pZCBmMmZzX2JhbGFuY2VfZnMoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpLCBib29sIG5lZWQpCj4gICAgICAgICBpZiAobmVlZCAmJiBleGNlc3Nf
Y2FjaGVkX25hdHMoc2JpKSkKPiAgICAgICAgICAgICAgICAgZjJmc19iYWxhbmNlX2ZzX2JnKHNi
aSwgZmFsc2UpOwo+Cj4gKyAgICAgICBpZiAodW5saWtlbHkoaXNfc2JpX2ZsYWdfc2V0KHNiaSwg
U0JJX0NQX0RJU0FCTEVEKSkpCj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiAgICAgICAgIGlm
ICghZjJmc19pc19jaGVja3BvaW50X3JlYWR5KHNiaSkpCj4gICAgICAgICAgICAgICAgIHJldHVy
bjsKSGkgQ2hhbywKV2hlbiBJIHJlYWQgdGhpcyBwYXRjaCwgSSBmZWVsIHRoYXQgaXQgaXMgc29t
ZXdoYXQgcmVkdW5kYW50IHdpdGggdGhlCmZvbGxvd2luZyBjaGVja2luZyBhYm91dCBTQklfQ1Bf
RElTQUJMRUQgaW4gZjJmc19pc19jaGVja3BvaW50X3JlYWR5LgpDYW4gd2UgcmVvcmdhbml6ZSB0
aGVzZSBjaGVja3MgZm9yIHRoZSBmMmZzX2JhbGFuY2VfZnMgY2FzZT8KVGhpcyB3aWxsIG1ha2Ug
dGhlIGNvZGUgZWFzaWVyIHRvIHJlYWQgYW5kIHVuZGVyc3RhbmQuCnRoYW5rcyEKPgo+IC0tCj4g
Mi40OS4wCj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
