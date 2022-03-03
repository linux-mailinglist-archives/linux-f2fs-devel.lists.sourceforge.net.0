Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E69854CB7B5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Mar 2022 08:27:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nPfs4-0006WM-M4; Thu, 03 Mar 2022 07:27:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <xiam0nd.tong@gmail.com>)
 id 1nPfs2-0006Vr-JP; Thu, 03 Mar 2022 07:27:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sgLnwuYIGskFjie2H2jjPO7yZK5PfHYTTkrYtctc5ws=; b=dhE9bGbH2ddxPjB9j0205G7Cef
 gv28x+v6Y7ScPGdpLa6fF1Ccr85UKIAu3gVsqfiGRRfof7H3Bsjyy0uP/4iaZs+zE7YMcYfZgD535
 TT/G5MZAV5yekGA/8jJ34BncfsGMaqPTBYC0peJKF6P2L22GNbFLXU+EB6gSmvMMMnr4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sgLnwuYIGskFjie2H2jjPO7yZK5PfHYTTkrYtctc5ws=; b=B8AKTvo6KVp80sIy/BpA52RdvP
 KHRBMdTncKSpfzSdMcIB/U4dg3WKGA5HhXulJcjwS9+j7cVOg18y2N5yQvh3OOmzbTSWdYNuGOFll
 TZSVLWlnVy53dcWUIhNRUW0Q+M4FKMpk9mp14uCEqwCDEsT01MY2YWLnuaTwNbCKkCFI=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nPfs0-0000cs-28; Thu, 03 Mar 2022 07:27:28 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 c16-20020a17090aa61000b001befad2bfaaso3608885pjq.1; 
 Wed, 02 Mar 2022 23:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sgLnwuYIGskFjie2H2jjPO7yZK5PfHYTTkrYtctc5ws=;
 b=FXSRJXcZ2cyaSSh+RFzgN891/0EsPjQQYnYlHyt7Q6au+u55Yhw9CQjtuc/Xh+IxeA
 jmfOE8xDuyw6aNjCCweSWK23ooxkZ+FDp1vmELSXGe87/BlE9lQAJ5VCHRxCoJXheQ6e
 z0ZjBk6ntNVuChDJjKVkipnrg4PFzEOabNhKEpFBHr+LTEWxBydNvmRMp4x1CJuZdUwr
 yIPtetuwCR4pZCzLE6nNdjkyjeKTi+kDUarqoW7jVGs3qBeY6IJUgMC1jfObzr57dlqg
 9D3LdaczFYPoymDULVGPmDhvRiVgHdjXQ/LS1xahv5fAEYKipZZ05ntIAVBo2UMKI5ki
 Sw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sgLnwuYIGskFjie2H2jjPO7yZK5PfHYTTkrYtctc5ws=;
 b=1HxMAhSv40KZHYeWB8GKoeA505/+eHq5EjoRSaPj7eGo71OI9ENO7XPD+CKAT2pJ3Q
 uW6GIxxX6N/p+uhCEzcTlg8qVEDE3gHC0tgi++dfwmUwXAWqLWctDOcN7VEwG3rjrc6C
 omgVxMOY8nHvComm+p0E8fAQhzn1vq86DnBLyz3qwO2phJC3xgmqlKrFLJl6yPI4qDeD
 JH+ssGb2GiCB0PdbfXGktbQOFd8oE6ytbE0oeWl3aayAULaQ37/xm2wVSuXj2xFE7qhg
 YUL/l1fYnL8ENXUD2X7ynD23/9umjUEJCxEDXBk4VMZnBEr35Juw7mZ4tpLNYuZ/QsTf
 2/pA==
X-Gm-Message-State: AOAM5311n/C/xI7bxTmjwml6zoRQRq4xi98hJRGdB01MDHtsbR6bGX0a
 4U+gYDvMLDjnNQsVtmGeFLU=
X-Google-Smtp-Source: ABdhPJxXZq8uo59Ohm7FMpyCTbKfTT1earKguyYxXh9VkI02LjxK1/LHoatHqlibGa3Ordge+YwobQ==
X-Received: by 2002:a17:902:9687:b0:151:7b31:9a57 with SMTP id
 n7-20020a170902968700b001517b319a57mr13723244plp.146.1646292442145; 
 Wed, 02 Mar 2022 23:27:22 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.19])
 by smtp.googlemail.com with ESMTPSA id
 nu18-20020a17090b1b1200b001bbef4d9049sm1302089pjb.23.2022.03.02.23.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 23:27:21 -0800 (PST)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: david.laight@aculab.com
Date: Thu,  3 Mar 2022 15:26:57 +0800
Message-Id: <20220303072657.11124-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <39404befad5b44b385698ff65465abe5@AcuMS.aculab.com>
References: <39404befad5b44b385698ff65465abe5@AcuMS.aculab.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 3 Mar 2022 04:58:23 +0000, David Laight wrote: > on
 3 Mar 2022 10:27:29 +0800, Xiaomeng Tong wrote: > > The problem is the mis-use
 of iterator outside the loop on exit, and > > the iterator wi [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.45 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [xiam0nd.tong[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nPfs0-0000cs-28
Subject: Re: [f2fs-dev] [PATCH 2/6] treewide: remove using list iterator
 after loop body as a ptr
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, gustavo@embeddedor.com,
 linux-iio@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux@rasmusvillemoes.dk, dri-devel@lists.freedesktop.org, c.giuffrida@vu.nl,
 amd-gfx@lists.freedesktop.org, torvalds@linux-foundation.org,
 samba-technical@lists.samba.org, linux1394-devel@lists.sourceforge.net,
 drbd-dev@lists.linbit.com, linux-arch@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, h.j.bos@vu.nl, jgg@ziepe.ca,
 intel-wired-lan@lists.osuosl.org, nouveau@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, dan.carpenter@oracle.com,
 linux-media@vger.kernel.org, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 bjohannesmeyer@gmail.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, christophe.jaillet@wanadoo.fr,
 jakobkoschel@gmail.com, v9fs-developer@lists.sourceforge.net,
 linux-tegra@vger.kernel.org, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 linux-sgx@vger.kernel.org, nathan@kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 xiam0nd.tong@gmail.com, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mediatek@lists.infradead.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, christian.koenig@amd.com, rppt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCAzIE1hciAyMDIyIDA0OjU4OjIzICswMDAwLCBEYXZpZCBMYWlnaHQgd3JvdGU6Cj4g
b24gMyBNYXIgMjAyMiAxMDoyNzoyOSArMDgwMCwgWGlhb21lbmcgVG9uZyB3cm90ZToKPiA+IFRo
ZSBwcm9ibGVtIGlzIHRoZSBtaXMtdXNlIG9mIGl0ZXJhdG9yIG91dHNpZGUgdGhlIGxvb3Agb24g
ZXhpdCwgYW5kCj4gPiB0aGUgaXRlcmF0b3Igd2lsbCBiZSB0aGUgSEVBRCdzIGNvbnRhaW5lcl9v
ZiBwb2ludGVyIHdoaWNoIHBvaW50ZXJzCj4gPiB0byBhIHR5cGUtY29uZnVzZWQgc3RydWN0LiBT
aWRlbm90ZTogVGhlICptaXMtdXNlKiBoZXJlIHJlZmVycyB0bwo+ID4gbWlzdGFrZWx5IGFjY2Vz
cyB0byBvdGhlciBtZW1iZXJzIG9mIHRoZSBzdHJ1Y3QsIGluc3RlYWQgb2YgdGhlCj4gPiBsaXN0
X2hlYWQgbWVtYmVyIHdoaWNoIGFjdXRhbGx5IGlzIHRoZSB2YWxpZCBIRUFELgo+Cj4gVGhlIHBy
b2JsZW0gaXMgdGhhdCB0aGUgSEVBRCdzIGNvbnRhaW5lcl9vZiBwb2ludGVyIHNob3VsZCBuZXZl
cgo+IGJlIGNhbGN1bGF0ZWQgYXQgYWxsLgo+IFRoaXMgaXMgd2hhdCBpcyBmdW5kYW1lbnRhbGx5
IGJyb2tlbiBhYm91dCB0aGUgY3VycmVudCBkZWZpbml0aW9uLgoKWWVzLCB0aGUgcnVsZSBpcyAi
dGhlIEhFQUQncyBjb250YWluZXJfb2YgcG9pbnRlciBzaG91bGQgbmV2ZXIgYmUKY2FsY3VsYXRl
ZCBhdCBhbGwgb3V0c2lkZSB0aGUgbG9vcCIsIGJ1dCBob3cgZG8geW91IG1ha2Ugc3VyZSBldmVy
eW9uZQpmb2xsb3dzIHRoaXMgcnVsZT8KRXZlcnlvbmUgbWFrZXMgbWlzdGFrZXMsIGJ1dCB3ZSBj
YW4gZWxpbWluYXRlIHRoZW0gYWxsIGZyb20gdGhlIGJlZ2lubmluZwp3aXRoIHRoZSBoZWxwIG9m
IGNvbXBpbGVyIHdoaWNoIGNhbiBjYXRjaCBzdWNoIHVzZS1hZnRlci1sb29wIHRoaW5ncy4KCj4g
PiBJT1csIHlvdSB3b3VsZCBkZXJlZmVyZW5jZSBhIChOVUxMICsgb2Zmc2V0X29mX21lbWJlcikg
YWRkcmVzcyBoZXJlLgo+Cj5XaGVyZT8KCkluIHRoZSBjYXNlIHdoZXJlIGEgZGV2ZWxvcGVyIGRv
IG5vdCBmb2xsb3dzIHRoZSBhYm92ZSBydWxlLCBhbmQgbWlzdGFrZWx5CmFjY2VzcyBhIG5vbi1s
aXN0LWhlYWQgbWVtYmVyIG9mIHRoZSBIRUFEJ3MgY29udGFpbmVyX29mIHBvaW50ZXIgb3V0c2lk
ZQp0aGUgbG9vcC4gRm9yIGV4YW1wbGU6CiAgICBzdHJ1Y3QgcmVxewogICAgICBpbnQgYTsKICAg
ICAgc3RydWN0IGxpc3RfaGVhZCBoOwogICAgfQogICAgc3RydWN0IHJlcSAqcjsKICAgIGxpc3Rf
Zm9yX2VhY2hfZW50cnkociwgSEVBRCwgaCkgewogICAgICBpZiAoci0+YSA9PSAweDEwKQogICAg
ICAgIGJyZWFrOwogICAgfQogICAgLy8gdGhlIGRldmVsb3BlciBtYWRlIGEgbWlzdGFrZTogaGUg
ZGlkbid0IHRha2UgdGhpcyBzaXR1YXRpb24gaW50bwogICAgLy8gYWNjb3VudCB3aGVyZSBhbGwg
ZW50cmllcyBpbiB0aGUgbGlzdCBhcmUgKnItPmEgIT0gMHgxMCosIGFuZCBub3cKICAgIC8vIHRo
ZSByIGlzIHRoZSBIRUFEJ3MgY29udGFpbmVyX29mIHBvaW50ZXIuIAogICAgci0+YSA9IDB4MjA7
ClRodXMgdGhlICJyLT5hID0gMHgyMCIgd291bGQgZGVyZWZlcmVuY2UgYSAoTlVMTCArIG9mZnNl
dF9vZl9tZW1iZXIpCmFkZHJlc3MgaGVyZS4KCj4gPiBQbGVhc2UgcmVtaW5kIG1lIGlmIGkgbWlz
c2VkIHNvbWV0aGluZywgdGhhbmtzLgo+ID4KPiA+IENhbiB5b3Ugc2hhcmUgeW91ciAiYWx0ZXJu
YXRpdmUgZGVmaW5pdGlvbnMiIGRldGFpbHM/IHRoYW5rcyEKPgo+IFRoZSBsb29wIHNob3VsZCBw
cm9iYWJseSB1c2UgYXMgZXh0cmEgdmFyaWFibGUgdGhhdCBwb2ludHMKPiB0byB0aGUgJ2xpc3Qg
bm9kZScgaW4gdGhlIG5leHQgc3RydWN0dXJlLgo+IFNvbWV0aGluZyBsaWtlOgo+IAlmb3IgKHh4
eCAqaXRlciA9IGhlYWQtPm5leHQ7Cj4gCQlpdGVyID09ICZoZWFkID8gKChpdGVtID0gTlVMTCks
MCkgOiAoKGl0ZW0gPSBsaXN0X2l0ZW0oaXRlciksMSkpOwo+IAkJaXRlciA9IGl0ZW0tPm1lbWJl
ci0+bmV4dCkgewo+IAkgICAuLi4KPiBXaXRoIGEgYml0IG9mIGNhc3RpbmcgeW91IGNhbiB1c2Ug
J2l0ZW0nIHRvIGhvbGQgJ2l0ZXInLgoKeW91IHN0aWxsIGNhbiBub3QgbWFrZSBzdXJlIGV2ZXJ5
b25lIGZvbGxvd3MgdGhpcyBydWxlOiAKImRvIG5vdCB1c2UgaXRlcmF0b3Igb3V0c2lkZSB0aGUg
bG9vcCIgd2l0aG91dCB0aGUgaGVscCBvZiBjb21waWxlciwKYmVjYXVzZSBpdGVtIGlzIGRlY2xh
cmVkIG91dHNpZGUgdGhlIGxvb3AuCgpCVFcsIHRvIGF2b2lkIGFtYmlndWl0ee+8jHRoZSAiYWx0
ZXJuYXRpdmUgZGVmaW5pdGlvbnMiIGhlcmUgaSBhc2tlZCBpcwpzb21ldGhpbmcgZnJvbSB5b3Ug
aW4gdGhpcyBjb250ZXh0OgoiT1RPSCB0aGVyZSBtYXkgYmUgYWx0ZXJuYXRpdmUgZGVmaW5pdGlv
bnMgdGhhdCBjYW4gYmUgdXNlZCB0byBnZXQKdGhlIGNvbXBpbGVyIChvciBvdGhlciBjb21waWxl
ci1saWtlIHRvb2xzKSB0byBkZXRlY3QgYnJva2VuIGNvZGUuCkV2ZW4gaWYgdGhlIGRlZmluaXRp
b24gY2FuJ3QgcG9zc2libHkgZ2VuZXJhdGUgYSB3b3JraW5nIGtlcnJuZWwuIgoKPiA+IAo+ID4g
PiBPVE9IIHRoZXJlIG1heSBiZSBhbHRlcm5hdGl2ZSBkZWZpbml0aW9ucyB0aGF0IGNhbiBiZSB1
c2VkIHRvIGdldAo+ID4gPiB0aGUgY29tcGlsZXIgKG9yIG90aGVyIGNvbXBpbGVyLWxpa2UgdG9v
bHMpIHRvIGRldGVjdCBicm9rZW4gY29kZS4KPiA+ID4gRXZlbiBpZiB0aGUgZGVmaW5pdGlvbiBj
YW4ndCBwb3NzaWJseSBnZW5lcmF0ZSBhIHdvcmtpbmcga2Vycm5lbC4KPiA+IAo+ID4gVGhlICJs
aXN0X2Zvcl9lYWNoX2VudHJ5X2luc2lkZShwb3MsIHR5cGUsIGhlYWQsIG1lbWJlcikiIHdheSBt
YWtlcwo+ID4gdGhlIGl0ZXJhdG9yIGludmlzaWFibGUgb3V0c2lkZSB0aGUgbG9vcCwgYW5kIHdv
dWxkIGJlIGNhdGNoZWQgYnkKPiA+IGNvbXBpbGVyIGlmIHVzZS1hZnRlci1sb29wIHRoaW5ncyBo
YXBwZW5lZC4KCj4gSXQgaXMgYWxzbyBhIGNvbXBldGUgUElUQSBmb3IgYW55dGhpbmcgZG9pbmcg
YSBzZWFyY2guCgpZb3UgbWVhbiBpdCB3b3VsZCBiZSBhIGJ1cmRlbiBvbiBzZWFyY2g/IGNhbiB5
b3Ugc2hvdyBtZSBzb21lIGV4YW1wbGVzPwoKT3IgeW91IG1lYW4gaXQgaXMgdG9vIGxvbmcgdGhl
IGxpc3RfZm9yX2VhY2hfZW50cnlfaW5zaWRlKiBzdHJpbmcgdG8gbGl2ZQppbiBvbmUgc2luZ2xl
IGxpbmUsIGFuZCBzaG91bGQgc3BpbHQgaW50byB0d28gbGluZT8gSWYgaXQgaXMgdGhlIGNhc2Us
IHRoZXJlCmFyZSAyIHdheSB0byBtaXRpZ2F0ZSBpdC4KMS4gcGFzcyBhIHNob3J0ZXIgdCBhcyBz
dHJ1Y3QgdHlwZSB0byB0aGUgbWFjcm8KMi4gYWZ0ZXIgYWxsIGxpc3RfZm9yX2VhY2hfZW50cnkg
bWFjcm9zIGJlIHJlcGxhY2VkIHdpdGgKbGlzdF9mb3JfZWFjaF9lbnRyeV9pbnNpZGUsIHJlbW92
ZSB0aGUgbGlzdF9mb3JfZWFjaF9lbnRyeSBpbXBsZW1lbnRhdGlvbnMKYW5kIHJlbmFtZSBhbGwg
bGlzdF9mb3JfZWFjaF9lbnRyeV9pbnNpZGUgdXNlIGJhY2sgdG8gdGhlIG9yaWdpbgpsaXN0X2Zv
cl9lYWNoX2VudHJ5IGluIGEgc2luZ2xlIHBhdGNoLgoKRm9yIG1lLCBpdCBpcyBhY2NlcHRhYmxl
IGFuZCBub3QgYSBzdWNoIGJpZyBwcm9ibGVtLgoKLS0KWGlhb21lbmcgVG9uZwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
