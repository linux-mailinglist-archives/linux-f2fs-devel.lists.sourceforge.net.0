Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 951CB65CBA7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 02:54:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pCsyx-00088G-5j;
	Wed, 04 Jan 2023 01:54:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ssawgyw@gmail.com>) id 1pCsyv-000889-NR
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 01:54:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3ENfREs/+kE8uL6hKvwskOdg+lSrgQr9bKPvZeVGJsQ=; b=VOVRML7upPl4r0KAVzw344QWN+
 9nqLqWB94GCbNQTHc/OBEiLn8gCxUWBkn7Lr3xcwGFhQHOnlbhm/2f9DsD9MDxVx8+TVMkGk4D8EF
 J31O8W1TbBEwieEUOJ5z1si7i7jOEjrJwWFJFj6ILUdr2TFfLat+VycnS5ypvWLOlKQo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3ENfREs/+kE8uL6hKvwskOdg+lSrgQr9bKPvZeVGJsQ=; b=OvQBsdvNhAE7WY+eMDDfCpIW20
 NJYAfqEXx3RLfL6RsVE4RAvXPYuADOB59GaCkHK6U9i59me6ssdr3Hpqd5TMXMKwKhH4yReQxlhvZ
 HwYrobOxCc6ky/82YtMrdhGrEoplnsuCHK2H8hJ4pLTV9j3Qph7glLcsl0G2PA/CV4v8=;
Received: from mail-lf1-f46.google.com ([209.85.167.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pCsyr-003xb5-IT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 01:54:17 +0000
Received: by mail-lf1-f46.google.com with SMTP id f34so48361401lfv.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 Jan 2023 17:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ENfREs/+kE8uL6hKvwskOdg+lSrgQr9bKPvZeVGJsQ=;
 b=l2Oa3ChyCBqNbRs+zG8Q6BjSygUEBDXqjvOtb6ISycKB4uz13FzHAd2NeOuT80deCp
 F16Ls0b3Hdpp2sDdKdqrXl8/UYlrxyjvUeXNgVAB5u0L9AWtjUCfXBz/NyCx3BzRq69w
 SrJI+RN9AJ8gOkTUDJYsZuAC+SrK26Y0tfgdEhAIL9ZInzItPmdOXi6ISqi5hB3rWzyp
 LzT1CpRrx+yJdky8GmUENBZLxQ6IPW2F8yWHMjQpPERIrhnpL4mlBn+ute/muhBRkncO
 mJQsxGdcc5fHz8hnS+pF0KcU4A/meIIeMZQWHigy0Ppo6dciulyyraX0Yzj3WVydOPce
 1Mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3ENfREs/+kE8uL6hKvwskOdg+lSrgQr9bKPvZeVGJsQ=;
 b=Un7wntz+plpzY1fyyZpT+IT2iElVqTm7PLfPvmbN/oZ21B6KGKyIwvuMevDIAXWQgf
 KEOd3cD3AL7olDD7QMy2ND1+0bffzRyn/dbQbpec2RkK1J1zjt75QYSiNC/Uve00qzZW
 VS98ds6+nADmoSJKWlFV9Q0SYssNqiffeXk7SQyFH/4WzjcHBgBL1rAmd3V7ehldy0MW
 YhsBDbnYFmCc7FsCF1xuJC+sqtHU9RByXtBlrMPjrGeuO/c+csE+BQaEkW4Cd2ACz09Z
 bUtCAgB95HFCIvOf32UU2h0qMHeDiH9dTJXxzX9hDYpXfMl+XAaNEoJNieclF68LljV7
 2h8A==
X-Gm-Message-State: AFqh2kp9LbOkkdVjU+aXUdx/sP/wgxrVFu/DSi99/6wknR5YG5H8NS1/
 0Cu5AcAxK+j74IwueeViiFDVSg3uSSKVMVsQX1wSLLH3WRkjFQ==
X-Google-Smtp-Source: AMrXdXummYS5wWjhsB82C1I1nGXyx/WY06hs91ePQQc/dWXl7bXvUORru8MGAx3oYddjt38BMzgtQGyukuftT2d1NC4=
X-Received: by 2002:ac2:53ae:0:b0:4b5:7968:630f with SMTP id
 j14-20020ac253ae000000b004b57968630fmr3152653lfh.351.1672797246897; Tue, 03
 Jan 2023 17:54:06 -0800 (PST)
MIME-Version: 1.0
References: <20221230154332.5082-1-chao@kernel.org>
 <167276540205.24190.7786330518792341546.git-patchwork-notify@kernel.org>
In-Reply-To: <167276540205.24190.7786330518792341546.git-patchwork-notify@kernel.org>
From: Yuwei Guan <ssawgyw@gmail.com>
Date: Wed, 4 Jan 2023 09:53:32 +0800
Message-ID: <CALJQGLmws5BBdDUYp3qiytEWrCLegT6RA+M+9H7O1kYfoy6TXg@mail.gmail.com>
To: patchwork-bot+f2fs@kernel.org
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  于2023年1月4日周三 01:04写道： > > Hello: > > This
    patch was applied to jaegeuk/f2fs.git (dev) > by Jaegeuk Kim : > > On Fri,
    30 Dec 2022 23:43:32 +0800 you wrote: > > With below two cases [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [ssawgyw[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.46 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.46 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1pCsyr-003xb5-IT
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid NULL pointer dereference
 in f2fs_issue_flush()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PHBhdGNod29yay1ib3QrZjJmc0BrZXJuZWwub3JnPiDkuo4yMDIz5bm0MeaciDTml6XlkajkuIkg
MDE6MDTlhpnpgZPvvJoKPgo+IEhlbGxvOgo+Cj4gVGhpcyBwYXRjaCB3YXMgYXBwbGllZCB0byBq
YWVnZXVrL2YyZnMuZ2l0IChkZXYpCj4gYnkgSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9y
Zz46Cj4KPiBPbiBGcmksIDMwIERlYyAyMDIyIDIzOjQzOjMyICswODAwIHlvdSB3cm90ZToKPiA+
IFdpdGggYmVsb3cgdHdvIGNhc2VzLCBpdCB3aWxsIGNhdXNlIE5VTEwgcG9pbnRlciBkZXJlZmVy
ZW5jZSB3aGVuCj4gPiBhY2Nlc3NpbmcgU01fSShzYmkpLT5mY2NfaW5mbyBpbiBmMmZzX2lzc3Vl
X2ZsdXNoKCkuCj4gPgo+ID4gYSkgSWYga3RocmVhZF9ydW4oKSBmYWlscyBpbiBmMmZzX2NyZWF0
ZV9mbHVzaF9jbWRfY29udHJvbCgpLCBpdCB3aWxsCj4gPiByZWxlYXNlIFNNX0koc2JpKS0+ZmNj
X2luZm8sCj4gPgo+ID4gLSBtb3VudCAtbyBub2ZsdXNoX21lcmdlIC9kZXYvdmRhIC9tbnQvZjJm
cwo+ID4gLSBtb3VudCAtbyByZW1vdW50LGZsdXNoX21lcmdlIC9kZXYvdmRhIC9tbnQvZjJmcyAg
LS0ga3RocmVhZF9ydW4oKSBmYWlscwo+ID4gLSBkZCBpZj0vZGV2L3plcm8gb2Y9L21udC9mMmZz
L2ZpbGUgYnM9NGsgY291bnQ9MSBjb252PWZzeW5jCj4gPgo+ID4gWy4uLl0KPgo+IEhlcmUgaXMg
dGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKPiAgIC0gW2YyZnMtZGV2XSBmMmZzOiBmaXggdG8gYXZv
aWQgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGluIGYyZnNfaXNzdWVfZmx1c2goKQo+ICAgICBo
dHRwczovL2dpdC5rZXJuZWwub3JnL2phZWdldXgvZjJmcy9jL2IzZDgzMDY2Y2JlYgo+CgpIaSBq
ZWFnZXVrLApUaGVyZSBpcyBhIGNoYXJhY3RlciBlcnJvciBpbiBwYXRjaHdvcmsgY29uZmlndXJh
dGlvbiwgOikuCjpzL2phZWdldXgvamVhZ2V1ay9nCgo+IFlvdSBhcmUgYXdlc29tZSwgdGhhbmsg
eW91IQo+IC0tCj4gRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KPiBodHRwczovL2tvcmcuZG9j
cy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1sCj4KPgo+Cj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
