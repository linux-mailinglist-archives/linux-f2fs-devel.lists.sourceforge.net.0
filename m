Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CC687F1D7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Mar 2024 22:12:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rmKHS-0006n1-63;
	Mon, 18 Mar 2024 21:12:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rmKHR-0006mv-5I
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Mar 2024 21:12:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jOmSWXBGJKbpv4KQjbyvpjiMj6pPHXaAxI1UbGjWR3A=; b=cQwoQCf5fOS40HIaa3ekerKu5P
 iNDfWGOgfRfBDImVKmA4Hluc9N+aWhRbUSBfOg2DngUuIBivaWuAIk4cPL6eiO9xV18hQFaa4ZVvi
 F3iJDvQw+c2BZuzGhUjyVzY3UCmCXCmxWpGuXdMaJei/d8qVVtSTunveNNt4hn/7hSAs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jOmSWXBGJKbpv4KQjbyvpjiMj6pPHXaAxI1UbGjWR3A=; b=Q8GLdnzAypKv04t/3ayhbBeqHA
 rMqREjaEcXxdJRAxcCOnPyYzvb9Vml2wBifju0GJdmMKDahfzpqixA/958H2mwbPivwFJoNknARPQ
 Gsk3SnOsJzw/lzXQjSbTOPO66waDB41+Vhf1sqKcJMZWPN27/5Hp7sN+Hqy/FNI5j04A=;
Received: from mail-vk1-f181.google.com ([209.85.221.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rmKHE-0003r9-Pv for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Mar 2024 21:12:24 +0000
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-4d43c633fecso1160423e0c.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 18 Mar 2024 14:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710796334; x=1711401134; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jOmSWXBGJKbpv4KQjbyvpjiMj6pPHXaAxI1UbGjWR3A=;
 b=kKDCztwn/pU8PFZnVuuIrV3TEAu/TQehH/JSXtuOcg0Zo8r81A3UmCYga41b0w6Opv
 kqHpDd0f3nLHTYLsfNbziFvFniWQihnu9mSw3uem3WWd9gdCw6hdHq6Ij558B9+01WRM
 vK0EtSIxEPI+VkBTOozCqmzwFTJpSI/fXzJiO1pUbk7cH6emcpa6mdYj2Qz8obCUicPJ
 4t6t3fMdCYE6qLOojk6o6kh3/Z6SEN/0qIyRsIiiHMVRaM9UH4wKUcX5sNiTDtNVpbVA
 cZykjBNvCyGJVHSJcEawv8oHPfcj25IGgcvtgf8Rf0H+1z+SttgACWCDlaP+g7+jV6W2
 dvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710796334; x=1711401134;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jOmSWXBGJKbpv4KQjbyvpjiMj6pPHXaAxI1UbGjWR3A=;
 b=cwLaCcOPtJey88mKlXO85ztFWgJyHndmBg1m2WR7ccBwpxqtD0C/ewsxQ91EPRG3zc
 FT8w2dC21kOz6nLxrTMZMt8Yh00YxPbsv/ERZ8tzB3I5otUep6yodEd4QNQ5tPM9cruM
 HYm9TPLTMS1fw9HwjW5x80fw0TBBusCrrvV/+8y6SeGkERVxYKDzVmv4mqICVlTnv6om
 uH+u1pGAlqN8OcVKKfADMEiQ7qKiEePS4dBJLdBDSh/MVviOHfcI/O8W/6nY8njRxCv2
 vcJxLW2BUKtO4xvy/Bt9++kNvrM7eVqGRUDqFjxzWkfpj6YR+3uYTVZ2TH7sluhGlXJI
 b7Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvA3tDGOqM7XGmwcBV+9X7ddF5cF1RdB4K3oNq47HwO38mwb9nxx/9zK5eLDLVWLwLk+NCCvpE5mk+apm7KBLiE13mNSHyV8rg/tuHs2/k7eIK4S4+ig==
X-Gm-Message-State: AOJu0Yx4RZlJoVwW2sky2i56OXAN5UV4A3lEjoLvOSU90VwKiGsSl+s0
 N5fsM7pmxmh1F3Zi/uiVCgn0I1ztVZS96iXnKqR3sm6PDbKIaivjyN17EBYJQWoNVOdbun5uf2s
 p3n18o3kzbfIE+ykrHLq5Urh9E0c=
X-Google-Smtp-Source: AGHT+IEAhnFwrXMM6Rg9dK7wlk0KB/AmNzUGURp45Z+sDG85WK9MSZZSjGyY7ZzAgyJc2CGBxoRdPDSNyZeqvGrWC78=
X-Received: by 2002:a1f:f401:0:b0:4d3:3446:6bcb with SMTP id
 s1-20020a1ff401000000b004d334466bcbmr320068vkh.16.1710796333894; Mon, 18 Mar
 2024 14:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAHj4cs-kfojYC9i0G73PRkYzcxCTex=-vugRFeP40g_URGvnfQ@mail.gmail.com>
 <esesb6dg5omj7e5sdnltnapuuzgmbdfmezcz6owsx2waqayc5q@36yhz4dmrxh6>
 <CAHj4cs874FivTdmw=VMJwTzzLFZWb4OKqvNGRN0R0O+Oiv4aYA@mail.gmail.com>
 <CAHj4cs_eOSafp0=cbwjNPR6X2342GF_cnUTcXf6RjrMnoOHSmQ@mail.gmail.com>
 <msec3wnqtvlsnfsw34uyrircyco3j3y7yb4gj75ofz5gnn57mg@qzcq5eumjwy5>
 <CAHj4cs-DC7QQH1W3KSzXS8ERMPW-6XQ9-w_Mzr1zEGF7ZZ=K3w@mail.gmail.com>
 <d6vi6aq44c4a7ekhck6zxxy4woa5q7v5bnvn5qmad7nqk7egms@ptc72tum4bks>
 <gngdj77k4picagsfdtiaa7gpgnup6fsgwzsltx6milmhegmjff@iax2n4wvrqye>
In-Reply-To: <gngdj77k4picagsfdtiaa7gpgnup6fsgwzsltx6milmhegmjff@iax2n4wvrqye>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 18 Mar 2024 14:12:02 -0700
Message-ID: <CACOAw_ydoaJTDu1eu+Lasz4AHReHqT5Pgd9a1h5Y4E8y_Hh-8A@mail.gmail.com>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sun, Mar 17, 2024 at 10:49 PM Shinichiro Kawasaki via
    Linux-f2fs-devel wrote: > > I confirmed that the trigger commit is dbf8e63f48af
    as Yi reported. I took a > look in the commit, but it looks [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.181 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.181 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rmKHE-0003r9-Pv
Subject: Re: [f2fs-dev] [bug report]WARNING: CPU: 22 PID: 44011 at
 fs/iomap/iter.c:51 iomap_iter+0x32b observed with blktests zbd/010
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
Cc: linux-block <linux-block@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Yi Zhang <yi.zhang@redhat.com>, Bart Van Assche <bvanassche@acm.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU3VuLCBNYXIgMTcsIDIwMjQgYXQgMTA6NDnigK9QTSBTaGluaWNoaXJvIEthd2FzYWtpIHZp
YQpMaW51eC1mMmZzLWRldmVsIDxsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dD4gd3JvdGU6Cj4KPiBJIGNvbmZpcm1lZCB0aGF0IHRoZSB0cmlnZ2VyIGNvbW1pdCBpcyBkYmY4
ZTYzZjQ4YWYgYXMgWWkgcmVwb3J0ZWQuIEkgdG9vayBhCj4gbG9vayBpbiB0aGUgY29tbWl0LCBi
dXQgaXQgbG9va3MgZmluZSB0byBtZS4gU28gSSB0aG91Z2h0IHRoZSBjYXVzZSBpcyBub3QKPiBp
biB0aGUgY29tbWl0IGRpZmYuCj4KPiBJIGZvdW5kIHRoZSBXQVJOIGlzIHByaW50ZWQgd2hlbiB0
aGUgZjJmcyBpcyBzZXQgdXAgd2l0aCBtdWx0aXBsZSBkZXZpY2VzLAo+IGFuZCByZWFkIHJlcXVl
c3RzIGFyZSBtYXBwZWQgdG8gdGhlIHZlcnkgZmlyc3QgYmxvY2sgb2YgdGhlIHNlY29uZCBkZXZp
Y2UgaW4gdGhlCj4gZGlyZWN0IHJlYWQgcGF0aC4gSW4gdGhpcyBjYXNlLCBmMmZzX21hcF9ibG9j
a3MoKSBhbmQgZjJmc19tYXBfYmxvY2tzX2NhY2hlZCgpCj4gbW9kaWZ5IG1hcC0+bV9wYmxrIGFz
IHRoZSBwaHlzaWNhbCBibG9jayBhZGRyZXNzIGZyb20gZWFjaCBibG9jayBkZXZpY2UuIEl0Cj4g
YmVjb21lcyB6ZXJvIHdoZW4gaXQgaXMgbWFwcGVkIHRvIHRoZSBmaXJzdCBibG9jayBvZiB0aGUg
ZGV2aWNlLiBIb3dldmVyLAo+IGYyZnNfaW9tYXBfYmVnaW4oKSBhc3N1bWVzIHRoYXQgbWFwLT5t
X3BibGsgaXMgdGhlIHBoeXNpY2FsIGJsb2NrIGFkZHJlc3Mgb2YgdGhlCj4gd2hvbGUgZjJmcywg
YWNyb3NzIHRoZSBhbGwgYmxvY2sgZGV2aWNlcy4gSXQgY29tcGFyZXMgbWFwLT5tX3BibGsgYWdh
aW5zdAo+IE5VTExfQUREUiA9PSAwLCB0aGVuIGdvIGludG8gdGhlIHVuZXhwZWN0ZWQgYnJhbmNo
IGFuZCBzZXRzIHRoZSBpbnZhbGlkCj4gaW9tYXAtPmxlbmd0aC4gVGhlIFdBUk4gY2F0Y2hlcyB0
aGUgaW52YWxpZCBpb21hcC0+bGVuZ3RoLgo+Cj4gVGhpcyBXQVJOIGlzIHByaW50ZWQgZXZlbiBm
b3Igbm9uLXpvbmVkIGJsb2NrIGRldmljZXMsIGJ5IGZvbGxvd2luZyBzdGVwcy4KPgo+ICAtIENy
ZWF0ZSB0d28gKG5vbi16b25lZCkgbnVsbF9ibGsgZGV2aWNlcyBtZW1vcnkgYmFja2VkIHdpdGgg
MTI4TUIgc2l6ZSBlYWNoOgo+ICAgIG51bGxiMCBhbmQgbnVsbGIxLgo+ICAjIG1rZnMuZjJmcyAv
ZGV2L251bGxiMCAtYyAvZGV2L251bGxiMQo+ICAjIG1vdW50IC10IGYyZnMgL2Rldi9udWxsYjAg
IiR7bW91bnRfZGlyfSIKPiAgIyBkZCBpZj0vZGV2L3plcm8gb2Y9IiR7bW91bnRfZGlyfS90ZXN0
LmRhdCIgYnM9MU0gY291bnQ9MTkyCj4gICMgZGQgaWY9IiR7bW91bnRfZGlyfS90ZXN0LmRhdCIg
b2Y9L2Rldi9udWxsIGJzPTFNIGNvdW50PTE5MiBpZmxhZz1kaXJlY3QKPgo+IEkgY3JlYXRlZCBh
IGZpeCBjYW5kaWRhdGUgcGF0Y2ggWzFdLiBJdCBtb2RpZmllcyBmMmZzX2lvbWFwX2JlZ2luKCkg
dG8gaGFuZGxlCj4gbWFwLT5tX3BibGsgYXMgdGhlIHBoeXNpY2FsIGJsb2NrIGFkZHJlc3MgZnJv
bSBlYWNoIGRldmljZSBzdGFydCwgbm90IHRoZQo+IGFkZHJlc3Mgb2Ygd2hvbGUgZjJmcy4gSSBj
b25maXJtZWQgaXQgYXZvaWRzIHRoZSBXQVJOLgo+Cj4gQnV0IEknbSBub3Qgc28gc3VyZSBpZiB0
aGUgZml4IGlzIGdvb2QgZW5vdWdoLiBtYXAtPm1fcGJsayBoYXMgZHVhbCBtZWFuaW5ncy4KPiBT
b21ldGltZXMgaXQgaG9sZHMgdGhlIHBoeXNpY2FsIGJsb2NrIGFkZHJlc3Mgb2YgZWFjaCBkZXZp
Y2UsIGFuZCBzb21ldGltZXMKPiB0aGUgYWRkcmVzcyBvZiB0aGUgd2hvbGUgZjJmcy4gSSdtIG5v
dCBzdXJlIHdoYXQgaXMgdGhlIGNvbmRpdGlvbiBmb3IKPiBtYXAtPm1fcGJsayB0byBoYXZlIHdo
aWNoIG1lYW5pbmcuIEkgZ3Vlc3MgRjJGU19HRVRfQkxPQ0tfRElPIGZsYWcgaXMgdGhlCj4gY29u
ZGl0aW9uLCBidXQgZjJmc19tYXBfYmxvY2tzX2NhY2hlZCgpIGRvZXMgbm90IGVuc3VyZSBpdC4K
Pgo+IEFsc28sIEkgbm90aWNlZCB0aGF0IG1hcC0+bV9wYmxrIGlzIHJlZmVycmVkIHRvIGluIG90
aGVyIGZ1bmN0aW9ucyBiZWxvdywgYW5kCj4gbm90IHN1cmUgaWYgdGhleSBuZWVkIHRoZSBzaW1p
bGFyIGNoYW5nZSBhcyBJIGRpZCBmb3IgZjJmc19pb21hcF9iZWdpbigpLgo+Cj4gICBmMmZzX2Zp
ZW1hcCgpCj4gICBmMmZzX3JlYWRfc2luZ2xlX3BhZ2UoKQo+ICAgZjJmc19ibWFwKCkKPiAgIGNo
ZWNrX3N3YXBfYWN0aXZhdGUoKQo+Cj4gSSB3b3VsZCBsaWtlIHRvIGhlYXIgYWR2aWNlcyBmcm9t
IGYyZnMgZXhwZXJ0cyBmb3IgdGhlIGZpeC4KPgo+Cj4gWzFdCj4KPiBkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+IGluZGV4IDI2ZTMxNzY5NmIzMy4uNTIzMjIy
M2E2OWU1IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4gKysrIGIvZnMvZjJmcy9kYXRh
LmMKPiBAQCAtMTU2OSw2ICsxNTY5LDcgQEAgc3RhdGljIGJvb2wgZjJmc19tYXBfYmxvY2tzX2Nh
Y2hlZChzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+ICAgICAgICAgICAgICAgICBpbnQgYmlkeCA9IGYy
ZnNfdGFyZ2V0X2RldmljZV9pbmRleChzYmksIG1hcC0+bV9wYmxrKTsKPiAgICAgICAgICAgICAg
ICAgc3RydWN0IGYyZnNfZGV2X2luZm8gKmRldiA9ICZzYmktPmRldnNbYmlkeF07Cj4KPiArICAg
ICAgICAgICAgICAgbWFwLT5tX211bHRpZGV2X2RpbyA9IHRydWU7Cj4gICAgICAgICAgICAgICAg
IG1hcC0+bV9iZGV2ID0gZGV2LT5iZGV2Owo+ICAgICAgICAgICAgICAgICBtYXAtPm1fcGJsayAt
PSBkZXYtPnN0YXJ0X2JsazsKPiAgICAgICAgICAgICAgICAgbWFwLT5tX2xlbiA9IG1pbihtYXAt
Pm1fbGVuLCBkZXYtPmVuZF9ibGsgKyAxIC0gbWFwLT5tX3BibGspOwo+IEBAIC00MjExLDkgKzQy
MTIsMTEgQEAgc3RhdGljIGludCBmMmZzX2lvbWFwX2JlZ2luKHN0cnVjdCBpbm9kZSAqaW5vZGUs
IGxvZmZfdCBvZmZzZXQsIGxvZmZfdCBsZW5ndGgsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCBmbGFncywgc3RydWN0IGlvbWFwICppb21hcCwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IGlvbWFwICpzcmNtYXApCj4gIHsKPiArICAgICAgIHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfSV9TQihpbm9kZSk7Cj4gICAgICAgICBzdHJ1
Y3QgZjJmc19tYXBfYmxvY2tzIG1hcCA9IHt9Owo+ICAgICAgICAgcGdvZmZfdCBuZXh0X3Bnb2Zz
ID0gMDsKPiAtICAgICAgIGludCBlcnI7Cj4gKyAgICAgICBibG9ja190IHBibGs7Cj4gKyAgICAg
ICBpbnQgZXJyLCBpOwo+Cj4gICAgICAgICBtYXAubV9sYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9k
ZSwgb2Zmc2V0KTsKPiAgICAgICAgIG1hcC5tX2xlbiA9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIG9m
ZnNldCArIGxlbmd0aCAtIDEpIC0gbWFwLm1fbGJsayArIDE7Cj4gQEAgLTQyMzksMTIgKzQyNDIs
MTcgQEAgc3RhdGljIGludCBmMmZzX2lvbWFwX2JlZ2luKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGxv
ZmZfdCBvZmZzZXQsIGxvZmZfdCBsZW5ndGgsCj4gICAgICAgICAgKiBXZSBzaG91bGQgbmV2ZXIg
c2VlIGRlbGFsbG9jIG9yIGNvbXByZXNzZWQgZXh0ZW50cyBoZXJlIGJhc2VkIG9uCj4gICAgICAg
ICAgKiBwcmlvciBmbHVzaGluZyBhbmQgY2hlY2tzLgo+ICAgICAgICAgICovCj4gLSAgICAgICBp
ZiAoV0FSTl9PTl9PTkNFKG1hcC5tX3BibGsgPT0gTkVXX0FERFIpKQo+ICsgICAgICAgcGJsayA9
IG1hcC5tX3BibGs7Cj4gKyAgICAgICBpZiAobWFwLm1fbXVsdGlkZXZfZGlvICYmIG1hcC5tX2Zs
YWdzICYgRjJGU19NQVBfTUFQUEVEKQo+ICsgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwg
c2JpLT5zX25kZXZzOyBpKyspCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKEZERVYoaSku
YmRldiA9PSBtYXAubV9iZGV2KQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGJs
ayArPSBGREVWKGkpLnN0YXJ0X2JsazsKPiArICAgICAgIGlmIChXQVJOX09OX09OQ0UocGJsayA9
PSBORVdfQUREUikpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+IC0gICAgICAg
aWYgKFdBUk5fT05fT05DRShtYXAubV9wYmxrID09IENPTVBSRVNTX0FERFIpKQo+ICsgICAgICAg
aWYgKFdBUk5fT05fT05DRShwYmxrID09IENPTVBSRVNTX0FERFIpKQo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPgo+IC0gICAgICAgaWYgKG1hcC5tX3BibGsgIT0gTlVMTF9BRERS
KSB7Cj4gKyAgICAgICBpZiAocGJsayAhPSBOVUxMX0FERFIpIHsKCkkgZmVlbCBsaWtlIHdlIHNo
b3VsZCBjaGVjayBvbmx5IHdoZXRoZXIgdGhlIGJsb2NrIGlzIHJlYWxseSBtYXBwZWQgb3IKbm90
IGJ5IGNoZWNraW5nIEYyRlNfTUFQX01BUFBFRCBmaWVsZCB3aXRob3V0IGNoYW5naW5nIHRoZSBw
YmxrLCBzaW5jZQoiMCIgcGJsayBmb3IgdGhlIHNlY29uZGFyeSBkZXZpY2Ugc2hvdWxkIHJlbWFp
biAwIGlmIGl0J3MgdGhlIGNvcnJlY3QKdmFsdWUuCgo+ICAgICAgICAgICAgICAgICBpb21hcC0+
bGVuZ3RoID0gYmxrc190b19ieXRlcyhpbm9kZSwgbWFwLm1fbGVuKTsKPiAgICAgICAgICAgICAg
ICAgaW9tYXAtPnR5cGUgPSBJT01BUF9NQVBQRUQ7Cj4gICAgICAgICAgICAgICAgIGlvbWFwLT5m
bGFncyB8PSBJT01BUF9GX01FUkdFRDsKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
