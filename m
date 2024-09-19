Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EE897C26A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Sep 2024 03:24:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sr5tg-00033i-Qq;
	Thu, 19 Sep 2024 01:23:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1sr5td-00033a-87
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Sep 2024 01:23:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3nc8TnxZcy0YR73tSERxQDGYOdOm2aQYHENKlCi39G8=; b=KAfm6Lfc576Vl0WQkYnUSCHY7Y
 ER6l5UrUgccCsUK2fmKfHYvygOHkcWA/L76QsRhN93x7OoH1HlsaJCqkDeN7OXTfC2ZJ7152voHJ7
 kXbD+8FlghwCKjB8ufzaoZteqoipd37dva2AV1GtvqB7GkLDG8DztbH5B/smfiuVtdXw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3nc8TnxZcy0YR73tSERxQDGYOdOm2aQYHENKlCi39G8=; b=GtC9RH510ksd8O6YvYHBCTA8rl
 aqTaZUCruHkB3L9MO6YBIri1+w5jFRrLsG2zynFi/7zswWkvMgc70ZLHQNn/Y6gGTX2cN4UhDZmkT
 8Gb7NLfQ20EaoAW2itBZA5rAVTYk9SAX4IyF2J6/CZn0FZlSrgtbO5YQDe64Te9vCHPk=;
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sr5td-0007pM-DJ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Sep 2024 01:23:49 +0000
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42cb0d0311fso431195e9.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Sep 2024 18:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726709018; x=1727313818; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3nc8TnxZcy0YR73tSERxQDGYOdOm2aQYHENKlCi39G8=;
 b=cuo95J7AicXpZhRFPIKNw4szXC22j6ncE5ya89DwqGSE37cZMo6xbbr+EzlUicMgN9
 FDaO6PkOnI7K5Chkhh67WC9dTyk/LdAeqCi1mktFffLxmW01+U06zGFhadpQxp6kUvRv
 SXiMWf6o4tYsqogkzaQAmJtMQKy0TymBqy5x4KktnCCOFPw0hdSw7kLPk7ZVqv7bAr8u
 I0bXKAQ+WHUo8gmpjNOnrduNC3wv60ZOn9ghRj/cRWnBgFwADQJrg1Tee3McAdL/sjRp
 nwWvVYyEbhdZfyElkyMJxsQ7HXTwQKqTp/gjmpTIo1f6PUM85cwIXS5jnsKITn6kqnfO
 5/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726709018; x=1727313818;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3nc8TnxZcy0YR73tSERxQDGYOdOm2aQYHENKlCi39G8=;
 b=SiphGTDtE0EnTQrj+O01tPRfexHguinBCF7nqqc2STNUfGKsFdREEDRKhpldmdXb7q
 4droWiyV9RM4+JjMdHB/qsBgtzvMQ3ZqjmimxVhLrXBac/f2pYHVRRvwhFNTAvkT/9Sv
 sSrTBpgVP10VI9vEw+9VjAtAQvaokFSS94RUm9GeRk4VOGWlmLhfiTjdF1+uAvHAf80H
 XmNDFjNQeE87+lcSglMUD+jB94tLS4JXES1BSfsydMxuQpnOd1uI/GQFZ2wogoYQ9Pg/
 nzm43zQsckEuSH/IT1ABVeukxWC80GOfbxPEw5jHh61n1N4wFBAoex8ZMw5zx2CReWyh
 Kpzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuSsMOrDlUelHZXSufoLEhfee+0KMBWgeSHFjlyK3j4Q9V+XaQ5rIa2zxyHwo5r1dtwOaZNP6KCauDBpQgdrIQ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzEHKSLxLsYi+n8vdvM/T8J+CpHs2nA62d77kVeoyokEWDl4BBb
 P4rlA4mqZAFaClZM2U39NFdnfYZJI0hT3MucLopCdsNGdQ5HJv/y1R4MEpRmVXya2bMMaKGAQ1F
 ej41TzACVHyLlhHTKYAgAufiR2Xk=
X-Google-Smtp-Source: AGHT+IEm3LMcM9PCILFtcZOMBc/sDEE84WrXK/XFe69ZsdfrGDbWYgqJ/F1ugpWhJxTWXELz449Gsezcy+AtZVOeHcQ=
X-Received: by 2002:a05:6000:2c5:b0:374:c2ce:eb1e with SMTP id
 ffacd0b85a97d-378c2d1186amr7465753f8f.8.1726709017538; Wed, 18 Sep 2024
 18:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <1726283507-16611-1-git-send-email-zhiguo.niu@unisoc.com>
In-Reply-To: <1726283507-16611-1-git-send-email-zhiguo.niu@unisoc.com>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 19 Sep 2024 09:23:25 +0800
Message-ID: <CAHJ8P3+=Ft_LOWHXPDdXQnQA=BsGhDLF0KYWWD6T3KHB-TEgWg@mail.gmail.com>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
X-Spam-Score: -1.0 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi all, please ignore this patch, we can resove this by "-b"
    parameter . thanks! Zhiguo Niu 于2024年9月14日周六 11:12写道： >
    > When 16K page/block size is enabled in Android platform, > a [...] 
 
 Content analysis details:   (-1.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -1.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.54 listed in wl.mailspike.net]
X-Headers-End: 1sr5td-0007pM-DJ
Subject: Re: [f2fs-dev] [PATCH] f2fs-toos: use getpagesize() to get default
 blocksize in Android
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
Cc: xiuhong.wang@unisoc.com, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgYWxsLApwbGVhc2UgaWdub3JlIHRoaXMgcGF0Y2gsICB3ZSBjYW4gcmVzb3ZlIHRoaXMgYnkg
Ii1iIiBwYXJhbWV0ZXIgLgp0aGFua3MhClpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNv
bT4g5LqOMjAyNOW5tDnmnIgxNOaXpeWRqOWFrSAxMToxMuWGmemBk++8mgo+Cj4gV2hlbiAxNksg
cGFnZS9ibG9jayBzaXplIGlzIGVuYWJsZWQgaW4gQW5kcm9pZCBwbGF0Zm9ybSwKPiBhIGVycm9y
IG1heWJlIGRldGVjdGVkIGluIG1vdW50IHByb2Nlc3MgaW4ga2VybmVsIGlmICItYiIKPiBwYXJh
bWV0ZXJzIGlzIG5vdCBzcGVjaWZpZWQgaW4gbWtmcy5mMmZzLgo+IEp1c3QgYXMgdGhlIGZvbGxv
d2luZyBjaGVjazoKPiBpZiAobGUzMl90b19jcHUocmF3X3N1cGVyLT5sb2dfYmxvY2tzaXplKSAh
PSBGMkZTX0JMS1NJWkVfQklUUykKPgo+IFNvIHVzZSBnZXRwYWdlc2l6ZSgpIHRvIGdldCBjb3Jy
ZWN0IGRlZmF1bHQgYmxvY2tzaXplLgo+Cj4gU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhp
Z3VvLm5pdUB1bmlzb2MuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFhpdWhvbmcgV2FuZyA8eGl1aG9u
Zy53YW5nQHVuaXNvYy5jb20+Cj4gLS0tCj4gIGxpYi9saWJmMmZzLmMgfCA5ICsrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvbGliL2xp
YmYyZnMuYyBiL2xpYi9saWJmMmZzLmMKPiBpbmRleCBlY2QyMmQ0Li45OGVlMGFlIDEwMDY0NAo+
IC0tLSBhL2xpYi9saWJmMmZzLmMKPiArKysgYi9saWIvbGliZjJmcy5jCj4gQEAgLTY4NSw4ICs2
ODUsMTcgQEAgdm9pZCBmMmZzX2luaXRfY29uZmlndXJhdGlvbih2b2lkKQo+Cj4gICAgICAgICBt
ZW1zZXQoJmMsIDAsIHNpemVvZihzdHJ1Y3QgZjJmc19jb25maWd1cmF0aW9uKSk7Cj4gICAgICAg
ICBjLm5kZXZzID0gMTsKPiArI2lmZGVmIFdJVEhfQU5EUk9JRAo+ICsgICAgICAgYy5ibGtzaXpl
ID0gZ2V0cGFnZXNpemUoKTsKPiArICAgICAgIGMuYmxrc2l6ZV9iaXRzID0gbG9nX2Jhc2VfMihj
LmJsa3NpemUpOwo+ICsgICAgICAgaWYgKCgxIDw8IGMuYmxrc2l6ZV9iaXRzKSAhPSBjLmJsa3Np
emUpIHsKPiArICAgICAgICAgICAgICAgYy5ibGtzaXplID0gMSA8PCBERUZBVUxUX0JMS1NJWkVf
QklUUzsKPiArICAgICAgICAgICAgICAgYy5ibGtzaXplX2JpdHMgPSBERUZBVUxUX0JMS1NJWkVf
QklUUzsKPiArICAgICAgIH0KPiArI2Vsc2UKPiAgICAgICAgIGMuYmxrc2l6ZSA9IDEgPDwgREVG
QVVMVF9CTEtTSVpFX0JJVFM7Cj4gICAgICAgICBjLmJsa3NpemVfYml0cyA9IERFRkFVTFRfQkxL
U0laRV9CSVRTOwo+ICsjZW5kaWYKPiAgICAgICAgIGMuc2VjdG9yc19wZXJfYmxrID0gREVGQVVM
VF9TRUNUT1JTX1BFUl9CTE9DSzsKPiAgICAgICAgIGMuYmxrc19wZXJfc2VnID0gREVGQVVMVF9C
TE9DS1NfUEVSX1NFR01FTlQ7Cj4gICAgICAgICBjLndhbnRlZF90b3RhbF9zZWN0b3JzID0gLTE7
Cj4gLS0KPiAxLjkuMQo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
