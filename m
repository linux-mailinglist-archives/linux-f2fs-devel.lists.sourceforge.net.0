Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D739DA73392
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Mar 2025 14:47:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txnaB-0005qL-Ou;
	Thu, 27 Mar 2025 13:47:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1txna9-0005q5-Rv
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 13:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GqeEwypR8kDCq+O5eVbDrYWGnSsbqCBzPUn2p2VQb+o=; b=eFIYF8iC7Y1itDJv4PQ04d8+At
 SkYtV4Ww/nVtv2LVp5eXJxAB4FP9Cb/LLD9DDSFfEG8TKu35rRenVAn7FG997THYAhRdb1oiCpWDZ
 B1dv8fzyt0f7xha2nNIQCvoKYYSYtNdJdmNe/YlCv6lPJTcQ2/2DUs9Rnq9qSWirSMks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GqeEwypR8kDCq+O5eVbDrYWGnSsbqCBzPUn2p2VQb+o=; b=KwPp7gAOvE25zIXlsE+VR8tupp
 2qu+I9xI8+CJm/pX2Jb664BE2KYNpZ1afEy8TluQ0anIJkNlYs6c736xGX8Qi02axp5Waij8Y2YJB
 gbGghyywSUhdlRdb9LIha3gw6r2Gc5gi4mV0qOX0OzHfJHVN5NuhrJHYUC7iLCDjEmCk=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1txna8-0000h2-PE for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 13:47:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3A90FA42A43;
 Thu, 27 Mar 2025 13:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46547C4CEDD;
 Thu, 27 Mar 2025 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743083249;
 bh=6QuAf9mZYKT0w3iBFYWyoO0jHuM/PJ89TbwzBkMY+qo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=AP/tNg3X5zl4xTlp1ODKhTYOsCVRC4BNbutvj+lKdprbFo2n6FTCnCjST2OTR70/1
 PNEDq+csk5tBrSoiTJ8eBE4WBQb55NT5t1Wqu6fBwTKwgxnr7yUylaWezuaFwch7Cf
 fsQMsqFc6wNbHw+RT6jVKQb0M7fs+zZfcHqvU8j/zlyYuv2iBEFqJq1fj+zXoOAAv+
 whAOtCFcx1oALaXkFjQDAk0kCof/MjYvQulZMUbxNChXn32jUFJM2zaziopBFUkEdi
 Fm5OHUgqOQ86QleTPOe+w+VadgODOxzL8Uv73XBUvxaRS3PanbjDVuOSl9ZmZkLEPY
 UnahLRth10G9A==
Message-ID: <60e763d5-dff4-44a1-9e80-48d384335027@kernel.org>
Date: Thu, 27 Mar 2025 21:47:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung@sk.com" <yohan.joung@sk.com>, Yohan Joung
 <jyh429@gmail.com>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "daeho43@gmail.com" <daeho43@gmail.com>
References: <20250326141428.280-1-yohan.joung@sk.com>
 <bf3f571c-a6bf-4a17-8745-039b37ac4f48@kernel.org>
 <2d95428375bd4a5592516bb6cefe4592@sk.com>
 <deb42999-df89-471b-a161-e33b97f96b74@kernel.org>
 <8d1f6aa914f94f5da1ccd46c75e9031b@sk.com>
Content-Language: en-US
In-Reply-To: <8d1f6aa914f94f5da1ccd46c75e9031b@sk.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2025/3/27 16:00, yohan.joung@sk.com wrote: >> From: Chao
    Yu <chao@kernel.org> >> Sent: Thursday, March 27, 2025 4:30 PM >> To: 정요한(JOUNG
    YOHAN) Mobile AE <yohan.joung@sk.com>; Yohan Joung >> [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [147.75.193.91 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1txna8-0000h2-PE
Subject: Re: [f2fs-dev] [External Mail] Re: [External Mail] Re: [PATCH]
 f2fs: prevent the current section from being selected as a victim during
 garbage collection
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: "pilhyun.kim@sk.com" <pilhyun.kim@sk.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNS8zLzI3IDE2OjAwLCB5b2hhbi5qb3VuZ0Bzay5jb20gd3JvdGU6Cj4+IEZyb206IENo
YW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4gU2VudDogVGh1cnNkYXksIE1hcmNoIDI3LCAyMDI1
IDQ6MzAgUE0KPj4gVG86IOygleyalO2VnChKT1VORyBZT0hBTikgTW9iaWxlIEFFIDx5b2hhbi5q
b3VuZ0Bzay5jb20+OyBZb2hhbiBKb3VuZwo+PiA8anloNDI5QGdtYWlsLmNvbT47IGphZWdldWtA
a2VybmVsLm9yZzsgZGFlaG80M0BnbWFpbC5jb20KPj4gQ2M6IGNoYW9Aa2VybmVsLm9yZzsgbGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7IGxpbnV4LQo+PiBrZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyDquYDtlYTtmIQoS0lNIFBJTEhZVU4pIE1vYmlsZSBBRSA8cGlsaHl1bi5r
aW1Ac2suY29tPgo+PiBTdWJqZWN0OiBbRXh0ZXJuYWwgTWFpbF0gUmU6IFtFeHRlcm5hbCBNYWls
XSBSZTogW1BBVENIXSBmMmZzOiBwcmV2ZW50IHRoZQo+PiBjdXJyZW50IHNlY3Rpb24gZnJvbSBi
ZWluZyBzZWxlY3RlZCBhcyBhIHZpY3RpbSBkdXJpbmcgZ2FyYmFnZSBjb2xsZWN0aW9uCj4+Cj4+
IE9uIDMvMjcvMjUgMTQ6NDMsIHlvaGFuLmpvdW5nQHNrLmNvbSB3cm90ZToKPj4+PiBGcm9tOiBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+Pj4gU2VudDogVGh1cnNkYXksIE1hcmNoIDI3LCAy
MDI1IDM6MDIgUE0KPj4+PiBUbzogWW9oYW4gSm91bmcgPGp5aDQyOUBnbWFpbC5jb20+OyBqYWVn
ZXVrQGtlcm5lbC5vcmc7Cj4+Pj4gZGFlaG80M0BnbWFpbC5jb20KPj4+PiBDYzogY2hhb0BrZXJu
ZWwub3JnOyBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldDsgbGludXgtCj4+
Pj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsg7KCV7JqU7ZWcKEpPVU5HIFlPSEFOKSBNb2JpbGUg
QUUKPj4+PiA8eW9oYW4uam91bmdAc2suY29tPgo+Pj4+IFN1YmplY3Q6IFtFeHRlcm5hbCBNYWls
XSBSZTogW1BBVENIXSBmMmZzOiBwcmV2ZW50IHRoZSBjdXJyZW50Cj4+Pj4gc2VjdGlvbiBmcm9t
IGJlaW5nIHNlbGVjdGVkIGFzIGEgdmljdGltIGR1cmluZyBnYXJiYWdlIGNvbGxlY3Rpb24KPj4+
Pgo+Pj4+IE9uIDMvMjYvMjUgMjI6MTQsIFlvaGFuIEpvdW5nIHdyb3RlOgo+Pj4+PiBXaGVuIHNl
bGVjdGluZyBhIHZpY3RpbSB1c2luZyBuZXh0X3ZpY3RpbV9zZWcgaW4gYSBsYXJnZSBzZWN0aW9u
LAo+Pj4+PiB0aGUgc2VsZWN0ZWQgc2VjdGlvbiBtaWdodCBhbHJlYWR5IGhhdmUgYmVlbiBjbGVh
cmVkIGFuZCBkZXNpZ25hdGVkCj4+Pj4+IGFzIHRoZSBuZXcgY3VycmVudCBzZWN0aW9uLCBtYWtp
bmcgaXQgYWN0aXZlbHkgaW4gdXNlLgo+Pj4+PiBUaGlzIGJlaGF2aW9yIGNhdXNlcyBpbmNvbnNp
c3RlbmN5IGJldHdlZW4gdGhlIFNJVCBhbmQgU1NBLgo+Pj4+Cj4+Pj4gSGksIGRvZXMgdGhpcyBm
aXggeW91ciBpc3N1ZT8KPj4+Cj4+PiBUaGlzIGlzIGFuIGlzc3VlIHRoYXQgYXJpc2VzIHdoZW4g
ZGl2aWRpbmcgYSBsYXJnZSBzZWN0aW9uIGludG8KPj4+IHNlZ21lbnRzIGZvciBnYXJiYWdlIGNv
bGxlY3Rpb24uCj4+PiBjYXVzZWQgYnkgdGhlIGJhY2tncm91bmQgR0MgKGdhcmJhZ2UgY29sbGVj
dGlvbikgdGhyZWFkIGluIGxhcmdlCj4+PiBzZWN0aW9uCj4+PiBmMmZzX2djKHZpY3RpbV9zZWN0
aW9uKSAtPgo+Pj4gZjJmc19jbGVhcl9wcmVmcmVlX3NlZ21lbnRzKHZpY3RpbV9zZWN0aW9uKS0+
Cj4+PiBjdXJzZWModmljdGltX3NlY3Rpb24pIC0+IGYyZnNfZ2ModmljdGltX3NlY3Rpb24gYnkg
bmV4dF92aWN0aW1fc2VnKQo+Pgo+PiBJIGRpZG4ndCBnZXQgaXQsIHdoeSBmMmZzX2dldF92aWN0
aW0oKSB3aWxsIHJldHVybiBzZWN0aW9uIHdoaWNoIGlzIHVzZWQKPj4gYnkgY3Vyc2VnPyBJdCBz
aG91bGQgYmUgYXZvaWRlZCBieSBjaGVja2luZyB3LyBzZWNfdXNhZ2VfY2hlY2soKS4KPj4KPj4g
T3Igd2UgbWlzc2VkIHRvIGNoZWNrIGdjaW5nIHNlY3Rpb24gd2hpY2ggbmV4dF92aWN0aW1fc2Vn
IHBvaW50cyB0byBkdXJpbmcKPj4gZ2V0X25ld19zZWdtZW50KCk/Cj4+Cj4+IENhbiB0aGlzIGhh
cHBlbj8KPj4KPj4gZS5nLgo+PiAtIGJnZ2Mgc2VsZWN0cyBzZWMgIzAKPj4gLSBuZXh0X3ZpY3Rp
bV9zZWc6IHNlZyAjMAo+PiAtIG1pZ3JhdGUgc2VnICMwIGFuZCBzdG9wCj4+IC0gbmV4dF92aWN0
aW1fc2VnOiBzZWcgIzEKPj4gLSBjaGVja3BvaW50LCBzZXQgc2VjICMwIGZyZWUgaWYgc2VjICMw
IGhhcyBubyB2YWxpZCBibG9ja3MKPj4gLSBhbGxvY2F0ZSBzZWcgIzAgaW4gc2VjICMwIGZvciBj
dXJzZWcKPj4gLSBjdXJzZWcgbW92ZXMgdG8gc2VnICMxIGFmdGVyIGFsbG9jYXRpb24KPj4gLSBi
Z2djIHRyaWVzIHRvIG1pZ3JhdGUgc2VnICMxCj4+Cj4+IFRoYW5rcywKPiBUaGF0J3MgY29ycmVj
dAo+IEluIGYyZnNfZ2V0X3ZpY3RpbSwgd2UgdXNlIG5leHRfdmljdGltX3NlZyB0bwo+IGRpcmVj
dGx5IGp1bXAgdG8gZ290X3Jlc3VsdCwgdGhlcmVieSBieXBhc3Npbmcgc2VjX3VzYWdlX2NoZWNr
Cj4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcyBjaGFuZ2U/Cj4gCj4gQEAgLTg1MCwxNSAr
ODUwLDIwIEBAIGludCBmMmZzX2dldF92aWN0aW0oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCB1
bnNpZ25lZCBpbnQgKnJlc3VsdCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgcC5taW5fc2Vn
bm8gPSBzYmktPm5leHRfdmljdGltX3NlZ1tCR19HQ107Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICpyZXN1bHQgPSBwLm1pbl9zZWdubzsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgc2Jp
LT5uZXh0X3ZpY3RpbV9zZWdbQkdfR0NdID0gTlVMTF9TRUdOTzsKPiAtICAgICAgICAgICAgICAg
ICAgICAgICBnb3RvIGdvdF9yZXN1bHQ7Cj4gICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAg
ICAgICAgICBpZiAoZ2NfdHlwZSA9PSBGR19HQyAmJgo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHNiaS0+bmV4dF92aWN0aW1fc2VnW0ZHX0dDXSAhPSBOVUxMX1NFR05PKSB7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgIHAubWluX3NlZ25vID0gc2JpLT5uZXh0X3ZpY3RpbV9z
ZWdbRkdfR0NdOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAqcmVzdWx0ID0gcC5taW5fc2Vn
bm87Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIHNiaS0+bmV4dF92aWN0aW1fc2VnW0ZHX0dD
XSA9IE5VTExfU0VHTk87Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgZ290byBnb3RfcmVzdWx0
Owo+ICAgICAgICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAgc2Vjbm8gPSBHRVRf
U0VDX0ZST01fU0VHKHNiaSwgc2Vnbm8pOwo+ICsKPiArICAgICAgICAgICAgICAgaWYgKHNlY191
c2FnZV9jaGVjayhzYmksIHNlY25vKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG5l
eHQ7Cj4gKwo+ICsgICAgICAgICAgICAgICBnb3RvIGdvdF9yZXN1bHQ7Cj4gICAgICAgICAgfQoK
QnV0IHN0aWxsIGFsbG9jYXRvciBjYW4gYXNzaWduIHRoaXMgc2VnbWVudCBhZnRlciBzZWNfdXNh
Z2VfY2hlY2soKSBpbgpyYWNlIGNvbmRpdGlvbiwgcmlnaHQ/CgpJTU8sIHdlIGNhbiBjbGVhciBu
ZXh0X3ZpY3RpbV9zZWdbXSBvbmNlIHNlY3Rpb24gaXMgZnJlZSBpbgpfX3NldF90ZXN0X2FuZF9m
cmVlKCk/IHNvbWV0aGluZyBsaWtlIHRoaXM6CgotLS0KICBmcy9mMmZzL3NlZ21lbnQuaCB8IDEz
ICsrKysrKysrKystLS0KICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuaCBiL2ZzL2YyZnMvc2VnbWVu
dC5oCmluZGV4IDA0NjVkYzAwYjM0OS4uODI2ZTM3OTk5MDg1IDEwMDY0NAotLS0gYS9mcy9mMmZz
L3NlZ21lbnQuaAorKysgYi9mcy9mMmZzL3NlZ21lbnQuaApAQCAtNDczLDkgKzQ3MywxNiBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgX19zZXRfdGVzdF9hbmRfZnJlZShzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksCiAgCQkJZ290byBza2lwX2ZyZWU7CiAgCQluZXh0ID0gZmluZF9uZXh0X2JpdChmcmVl
X2ktPmZyZWVfc2VnbWFwLAogIAkJCQlzdGFydF9zZWdubyArIFNFR1NfUEVSX1NFQyhzYmkpLCBz
dGFydF9zZWdubyk7Ci0JCWlmIChuZXh0ID49IHN0YXJ0X3NlZ25vICsgdXNhYmxlX3NlZ3MpIHsK
LQkJCWlmICh0ZXN0X2FuZF9jbGVhcl9iaXQoc2Vjbm8sIGZyZWVfaS0+ZnJlZV9zZWNtYXApKQot
CQkJCWZyZWVfaS0+ZnJlZV9zZWN0aW9ucysrOworCQlpZiAoKG5leHQgPj0gc3RhcnRfc2Vnbm8g
KyB1c2FibGVfc2VncykgJiYKKwkJCXRlc3RfYW5kX2NsZWFyX2JpdChzZWNubywgZnJlZV9pLT5m
cmVlX3NlY21hcCkpIHsKKwkJCWZyZWVfaS0+ZnJlZV9zZWN0aW9ucysrOworCisJCQlpZiAoR0VU
X1NFQ19GUk9NX1NFRyhzYmktPm5leHRfdmljdGltX3NlZ1tCR19HQ10pID09CisJCQkJCQkJCQlz
ZWNubykKKwkJCQlzYmktPm5leHRfdmljdGltX3NlZ1tCR19HQ10gPSBOVUxMX1NFR05POworCQkJ
aWYgKEdFVF9TRUNfRlJPTV9TRUcoc2JpLT5uZXh0X3ZpY3RpbV9zZWdbRkdfR0NdKSA9PQorCQkJ
CQkJCQkJc2Vjbm8pCisJCQkJc2JpLT5uZXh0X3ZpY3RpbV9zZWdbRkdfR0NdID0gTlVMTF9TRUdO
TzsKICAJCX0KICAJfQogIHNraXBfZnJlZToKLS0gCjIuNDAuMQoKPj4KPj4+Cj4+PiBCZWNhdXNl
IHRoZSBjYWxsIHN0YWNrIGlzIGRpZmZlcmVudCwKPj4+IEkgdGhpbmsgdGhhdCBpbiBvcmRlciB0
byBoYW5kbGUgZXZlcnl0aGluZyBhdCBvbmNlLCB3ZSBuZWVkIHRvIGFkZHJlc3MKPj4+IGl0IHdp
dGhpbiBkb19nYXJiYWdlX2NvbGxlY3QsIG9yIG90aGVyd2lzZSBpbmNsdWRlIGl0IG9uIGJvdGgg
c2lkZXMuCj4+PiBXaGF0IGRvIHlvdSB0aGluaz8KPj4+Cj4+PiBbMzAxNDYuMzM3NDcxXVsgVDEz
MDBdIEYyRlMtZnMgKGRtLTU0KTogSW5jb25zaXN0ZW50IHNlZ21lbnQgKDcwOTYxKQo+Pj4gdHlw
ZSBbMCwgMV0gaW4gU1NBIGFuZCBTSVQgWzMwMTQ2LjM0NjE1MV1bIFQxMzAwXSBDYWxsIHRyYWNl
Ogo+Pj4gWzMwMTQ2LjM0NjE1Ml1bIFQxMzAwXSAgZHVtcF9iYWNrdHJhY2UrMHhlOC8weDEwYyBb
MzAxNDYuMzQ2MTU3XVsKPj4+IFQxMzAwXSAgc2hvd19zdGFjaysweDE4LzB4MjggWzMwMTQ2LjM0
NjE1OF1bIFQxMzAwXQo+Pj4gZHVtcF9zdGFja19sdmwrMHg1MC8weDZjIFszMDE0Ni4zNDYxNjFd
WyBUMTMwMF0gIGR1bXBfc3RhY2srMHgxOC8weDI4Cj4+PiBbMzAxNDYuMzQ2MTYyXVsgVDEzMDBd
ICBmMmZzX3N0b3BfY2hlY2twb2ludCsweDFjLzB4M2MgWzMwMTQ2LjM0NjE2NV1bCj4+PiBUMTMw
MF0gIGRvX2dhcmJhZ2VfY29sbGVjdCsweDQxYy8weDI3MWMgWzMwMTQ2LjM0NjE2N11bIFQxMzAw
XQo+Pj4gZjJmc19nYysweDI3Yy8weDgyOCBbMzAxNDYuMzQ2MTY4XVsgVDEzMDBdICBnY190aHJl
YWRfZnVuYysweDI5MC8weDg4Ywo+Pj4gWzMwMTQ2LjM0NjE2OV1bIFQxMzAwXSAga3RocmVhZCsw
eDExYy8weDE2NCBbMzAxNDYuMzQ2MTcyXVsgVDEzMDBdCj4+PiByZXRfZnJvbV9mb3JrKzB4MTAv
MHgyMAo+Pj4KPj4+IHN0cnVjdCBjdXJzZWdfaW5mbyA6IDB4ZmZmZmZmODAzZjk1ZTgwMCB7Cj4+
PiAJc2Vnbm8gICAgICAgIDogMHgxMTUzMSA6IDcwOTYxCj4+PiB9Cj4+Pgo+Pj4gc3RydWN0IGYy
ZnNfc2JfaW5mbyA6IDB4ZmZmZmZmODgxMWQxMjAwMCB7Cj4+PiAJbmV4dF92aWN0aW1fc2VnWzBd
IDogMHgxMTUzMSA6IDcwOTYxCj4+PiB9Cj4+Pgo+Pj4+Cj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtZjJmcy1kZXZlbC8yMDI1MDMyNTA4MDY0Ni4zMjkxOTQ3LTItCj4+Pj4gY2hh
b0BrZXJuZWwub3JnCj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9m
Zi1ieTogWW9oYW4gSm91bmcgPHlvaGFuLmpvdW5nQHNrLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICAg
ZnMvZjJmcy9nYy5jIHwgNCArKysrCj4+Pj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9nYy5jIGIvZnMvZjJmcy9nYy5j
IGluZGV4Cj4+Pj4+IDJiOGY5MjM5YmVkZS4uNGI1ZDE4ZTM5NWViIDEwMDY0NAo+Pj4+PiAtLS0g
YS9mcy9mMmZzL2djLmMKPj4+Pj4gKysrIGIvZnMvZjJmcy9nYy5jCj4+Pj4+IEBAIC0xOTI2LDYg
KzE5MjYsMTAgQEAgaW50IGYyZnNfZ2Moc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QK
Pj4+PiBmMmZzX2djX2NvbnRyb2wgKmdjX2NvbnRyb2wpCj4+Pj4+ICAgCQlnb3RvIHN0b3A7Cj4+
Pj4+ICAgCX0KPj4+Pj4KPj4+Pj4gKwlpZiAoX19pc19sYXJnZV9zZWN0aW9uKHNiaSkgJiYKPj4+
Pj4gKwkJCUlTX0NVUlNFQyhzYmksIEdFVF9TRUNfRlJPTV9TRUcoc2JpLCBzZWdubykpKQo+Pj4+
PiArCQlnb3RvIHN0b3A7Cj4+Pj4+ICsKPj4+Pj4gICAJc2VnX2ZyZWVkID0gZG9fZ2FyYmFnZV9j
b2xsZWN0KHNiaSwgc2Vnbm8sICZnY19saXN0LCBnY190eXBlLAo+Pj4+PiAgIAkJCQlnY19jb250
cm9sLT5zaG91bGRfbWlncmF0ZV9ibG9ja3MsCj4+Pj4+ICAgCQkJCWdjX2NvbnRyb2wtPm9uZV90
aW1lKTsKPj4+Cj4gCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
