Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 330F88C83ED
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 May 2024 11:39:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s7u3F-0008Qe-Nm;
	Fri, 17 May 2024 09:38:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rafael@kernel.org>) id 1s7u3A-0008Py-WE;
 Fri, 17 May 2024 09:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HO8Bz9GyifotSrZV7QjN+iGapa2oFgA0NCUBiN/L4cc=; b=dGC8VlpnPQviUUvhaqt4ZgdBn8
 h3f0CjbZrPE4sgyEQow39RShwDuoJAIq76qw1SSQ5XirekO58TV7+FaF6NXnhFHhunWxX/ux5Us4K
 dprE8K4SApqP7aX4eDfOR8N+/Z76r9nq/74o3D4AJcVwUD4s2r8zUjyU2RmlpWIG7MxQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HO8Bz9GyifotSrZV7QjN+iGapa2oFgA0NCUBiN/L4cc=; b=LJ/00mqhaw+sVN6mIhjhsv92Do
 z6+nlA5vKi191byTtKWBMY9MavRAEFWgwjZRm94wBsMQa/+/ARwSK4JjEgczsrieFE8P2W9j0sYAR
 yfpE7mjFmqhM5MEeyUmroa8KA0maDmz89C3WkF+tF4s1O9o3MPFuwJ6ZDAuj6HZbAENc=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s7u3B-0001ie-4T; Fri, 17 May 2024 09:38:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 63BD4CE0AC2;
 Fri, 17 May 2024 09:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49336C32782;
 Fri, 17 May 2024 09:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715938719;
 bh=vcW+W1wogmO6WY+GSQu3IAR/P96Rw6SpWddj5psVWwk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q7nnnXKoCoZCRE9y8qfd0GjlbgMZcow94ZBAhyo/a3WB7eilpoBw2+BvdmX0v1BZf
 e7OVkid9omI+gvcN303kxsn1XDNSTYdJqgftO+q7xqgbBFEfRALDNx6MNApEOaSItp
 R/U+wW3wKfdgVg1pSTt+l5Ktt5O2287ep0H8zh6uS0rANv32EVrNlYH0N2LN0Wkz4S
 7JyAvYOZKqMfev4RirENIqVjY9S2NBz5t0xMnmDlB0lD8J6a25LhI7NPYbYJS3uooO
 gi0eyy/jJtvOQvPPH73HE5rAvo90fxUfGOyoScW2xWZLVtSxLMRh/mH25kBaP3Lv2i
 C+gw9xG0H/JCg==
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-5b2fbe85f82so267616eaf.1; 
 Fri, 17 May 2024 02:38:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVtE1ro71RZZa0jafcEL7v4PeTWzyefJf+EcUeuh5/McAicU8jtGPO7LmX2FxNClLuDWOKA01sT5kSx++sWhg04Js1s+JpgpQSJDAeJkDr3yS6iiD7e9uBcpPxSsLYwyBdT50+csB5YRep+0dXDm0LJucyODnKeYv22PovNFQ==
X-Gm-Message-State: AOJu0YyVYo0WTW/jhUUw3uaDxLozqvRvg6K+/bwGRa0yGxMDh0yyAUh2
 CKmfD7F9qGnsE1GPzHSf9zHEHF3uQrABGIZzCbhPoObQbe1j/wJU1+bKnIJAwdhst0ILyy1xETQ
 otBOYkZaoeWbcdINeG9LuGMChEDo=
X-Google-Smtp-Source: AGHT+IGDE99s+s68qJbXMtkzFnMd5s/9OBNB6sR0+sCICB0PpLHU9X3BbBFmCRlDywLZhowLPWB9T1lJ6YvckXBFFDs=
X-Received: by 2002:a05:6820:2602:b0:5b2:8017:fb68 with SMTP id
 006d021491bc7-5b2815cd95fmr22153827eaf.0.1715938718475; Fri, 17 May 2024
 02:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240516133454.681ba6a0@rorschach.local.home>
In-Reply-To: <20240516133454.681ba6a0@rorschach.local.home>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 17 May 2024 11:38:25 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hGNNvUq-BNHynaWr-5YVC6ugki81R70SG4uu34Rk-Mew@mail.gmail.com>
Message-ID: <CAJZ5v0hGNNvUq-BNHynaWr-5YVC6ugki81R70SG4uu34Rk-Mew@mail.gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
X-Spam-Score: -6.2 (------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, May 16, 2024 at 7:35 PM Steven Rostedt <rostedt@goodmis.org>
    wrote: > > From: "Steven Rostedt (Google)" <rostedt@goodmis.org> > > [ >
   This is a treewide change. I will likely re-create this [...] 
 
 Content analysis details:   (-6.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [145.40.73.55 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s7u3B-0001ie-4T
Subject: Re: [f2fs-dev] [PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
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
Cc: linux-hyperv@vger.kernel.org, linux-usb@vger.kernel.org,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 brcm80211@lists.linux.dev, ath10k@lists.infradead.org,
 Julia Lawall <Julia.Lawall@inria.fr>, linux-s390@vger.kernel.org,
 dev@openvswitch.org, linux-cifs@vger.kernel.org, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, io-uring@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, iommu@lists.linux.dev,
 ath11k@lists.infradead.org, linux-media@vger.kernel.org,
 linux-wpan@vger.kernel.org, linux-pm@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-erofs@lists.ozlabs.org, virtualization@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-block@vger.kernel.org,
 ocfs2-devel@lists.linux.dev,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-cxl@vger.kernel.org,
 linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com,
 Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ath12k@lists.infradead.org, tipc-discussion@lists.sourceforge.net,
 Masami Hiramatsu <mhiramat@kernel.org>, netdev@vger.kernel.org,
 bpf@vger.kernel.org, Linux trace kernel <linux-trace-kernel@vger.kernel.org>,
 freedreno@lists.freedesktop.org, linux-nfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBNYXkgMTYsIDIwMjQgYXQgNzozNeKAr1BNIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0
QGdvb2RtaXMub3JnPiB3cm90ZToKPgo+IEZyb206ICJTdGV2ZW4gUm9zdGVkdCAoR29vZ2xlKSIg
PHJvc3RlZHRAZ29vZG1pcy5vcmc+Cj4KPiBbCj4gICAgVGhpcyBpcyBhIHRyZWV3aWRlIGNoYW5n
ZS4gSSB3aWxsIGxpa2VseSByZS1jcmVhdGUgdGhpcyBwYXRjaCBhZ2FpbiBpbgo+ICAgIHRoZSBz
ZWNvbmQgd2VlayBvZiB0aGUgbWVyZ2Ugd2luZG93IG9mIHY2LjEwIGFuZCBzdWJtaXQgaXQgdGhl
bi4gSG9waW5nCj4gICAgdG8ga2VlcCB0aGUgY29uZmxpY3RzIHRoYXQgaXQgd2lsbCBjYXVzZSB0
byBhIG1pbmltdW0uCj4gXQo+Cj4gV2l0aCB0aGUgcmV3b3JrIG9mIGhvdyB0aGUgX19zdHJpbmco
KSBoYW5kbGVzIGR5bmFtaWMgc3RyaW5ncyB3aGVyZSBpdAo+IHNhdmVzIG9mZiB0aGUgc291cmNl
IHN0cmluZyBpbiBmaWVsZCBpbiB0aGUgaGVscGVyIHN0cnVjdHVyZVsxXSwgdGhlCj4gYXNzaWdu
bWVudCBvZiB0aGF0IHZhbHVlIHRvIHRoZSB0cmFjZSBldmVudCBmaWVsZCBpcyBzdG9yZWQgaW4g
dGhlIGhlbHBlcgo+IHZhbHVlIGFuZCBkb2VzIG5vdCBuZWVkIHRvIGJlIHBhc3NlZCBpbiBhZ2Fp
bi4KPgo+IFRoaXMgbWVhbnMgdGhhdCB3aXRoOgo+Cj4gICBfX3N0cmluZyhmaWVsZCwgbXlzdHJp
bmcpCj4KPiBXaGljaCB1c2UgdG8gYmUgYXNzaWduZWQgd2l0aCBfX2Fzc2lnbl9zdHIoZmllbGQs
IG15c3RyaW5nKSwgbm8gbG9uZ2VyCj4gbmVlZHMgdGhlIHNlY29uZCBwYXJhbWV0ZXIgYW5kIGl0
IGlzIHVudXNlZC4gV2l0aCB0aGlzLCBfX2Fzc2lnbl9zdHIoKQo+IHdpbGwgbm93IG9ubHkgZ2V0
IGEgc2luZ2xlIHBhcmFtZXRlci4KPgo+IFRoZXJlJ3Mgb3ZlciA3MDAgdXNlcnMgb2YgX19hc3Np
Z25fc3RyKCkgYW5kIGJlY2F1c2UgY29jY2luZWxsZSBkb2VzIG5vdAo+IGhhbmRsZSB0aGUgVFJB
Q0VfRVZFTlQoKSBtYWNybyBJIGVuZGVkIHVwIHVzaW5nIHRoZSBmb2xsb3dpbmcgc2VkIHNjcmlw
dDoKPgo+ICAgZ2l0IGdyZXAgLWwgX19hc3NpZ25fc3RyIHwgd2hpbGUgcmVhZCBhIDsgZG8KPiAg
ICAgICBzZWQgLWUgJ3MvXChfX2Fzc2lnbl9zdHIoW14sXSpbXiAsXVwpICosW147XSovXDEpLycg
JGEgPiAvdG1wL3Rlc3QtZmlsZTsKPiAgICAgICBtdiAvdG1wL3Rlc3QtZmlsZSAkYTsKPiAgIGRv
bmUKPgo+IEkgdGhlbiBzZWFyY2hlZCBmb3IgX19hc3NpZ25fc3RyKCkgdGhhdCBkaWQgbm90IGVu
ZCB3aXRoICc7JyBhcyB0aG9zZQo+IHdlcmUgbXVsdGkgbGluZSBhc3NpZ25tZW50cyB0aGF0IHRo
ZSBzZWQgc2NyaXB0IGFib3ZlIHdvdWxkIGZhaWwgdG8gY2F0Y2guCj4KPiBOb3RlLCB0aGUgc2Ft
ZSB1cGRhdGVzIHdpbGwgbmVlZCB0byBiZSBkb25lIGZvcjoKPgo+ICAgX19hc3NpZ25fc3RyX2xl
bigpCj4gICBfX2Fzc2lnbl9yZWxfc3RyKCkKPiAgIF9fYXNzaWduX3JlbF9zdHJfbGVuKCkKPgo+
IEkgdGVzdGVkIHRoaXMgd2l0aCBib3RoIGFuIGFsbG1vZGNvbmZpZyBhbmQgYW4gYWxseWVzY29u
ZmlnIChidWlsZCBvbmx5IGZvciBib3RoKS4KPgo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC10cmFjZS1rZXJuZWwvMjAyNDAyMjIyMTE0NDIuNjM0MTkyNjUzQGdvb2RtaXMub3Jn
Lwo+Cj4gQ2M6IE1hc2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+Cj4gQ2M6IE1h
dGhpZXUgRGVzbm95ZXJzIDxtYXRoaWV1LmRlc25veWVyc0BlZmZpY2lvcy5jb20+Cj4gQ2M6IExp
bnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBDYzogSnVsaWEg
TGF3YWxsIDxKdWxpYS5MYXdhbGxAaW5yaWEuZnI+Cj4gU2lnbmVkLW9mZi1ieTogU3RldmVuIFJv
c3RlZHQgKEdvb2dsZSkgPHJvc3RlZHRAZ29vZG1pcy5vcmc+CgpBY2tlZC1ieTogUmFmYWVsIEou
IFd5c29ja2kgPHJhZmFlbEBrZXJuZWwub3JnPiAjIGZvciB0aGVybWFsCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
