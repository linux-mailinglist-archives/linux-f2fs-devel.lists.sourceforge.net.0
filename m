Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24349625774
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Nov 2022 10:58:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1otQnU-0006vH-Cz;
	Fri, 11 Nov 2022 09:58:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <arnd@arndb.de>) id 1otQnM-0006uw-1q
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Nov 2022 09:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:Cc:
 To:From:Date:References:In-Reply-To:Message-Id:Mime-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b7XPwc4bj4pQJuvSbD7H9uyA+buey1LxLq7ggZ+S3dQ=; b=RIsFNP5DjpUSP5iaelspTlbt82
 ih+4ymOWOaCdHWhqcfsfDH0+irV94vNuk6s9G7/rnC/Ssm65NtHfehKyFhN294PxI8At7O26blRy6
 pDBATIE10wzPNaxmWy0n3ooA0xf89Xt+dCT8Xwl7ns+936fH6m6ifUNhuPXZwSNEP+3I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:Cc:To:From:Date:References
 :In-Reply-To:Message-Id:Mime-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b7XPwc4bj4pQJuvSbD7H9uyA+buey1LxLq7ggZ+S3dQ=; b=knE5mSnsv0dwSO2py5caGoDyWM
 kNxE4AGqKJIAZhJQxdC6musIUVKV8qMFzofHhISwHKX+2Ni+3FDo8nUI0f/+ZJL8p9EADxtDDkXSk
 yLI5bH4EIE1/q/SlwJ9x3yCLzXdTdEOcBRNpsrzUGuP5w6vrDruXFtCMYM1/MX8BjoaY=;
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1otQnG-0006X2-8w for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Nov 2022 09:57:54 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id F40C55C00D7;
 Fri, 11 Nov 2022 04:57:42 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Fri, 11 Nov 2022 04:57:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1668160662; x=
 1668247062; bh=b7XPwc4bj4pQJuvSbD7H9uyA+buey1LxLq7ggZ+S3dQ=; b=P
 PeCk4miRzjy7uOJpTTtcn5CH/PaA/dCTbj6Bg95I4Xgr4OjR+8hNFkEth8tuS36X
 GSY9tPZfXgwd+OoNrSIPj/FMV7cFJvvPP5joYP7DYkeAfeYkX31EPchnfjfbTU0a
 1RNndw1sN3PqZvcPpW/5GkFCUI3m9o8lcWxSyOGqwhrVQIMhRft1KoQNxsXnNd8c
 l3ImG/LfTz7OyaDw6cTodgRWLgC1bhHK7x4Hj4RwGMElbljT8aB9uLirvfKFd0AA
 ljXUdEfSXBiEsc/C0xBfCB9QKUraIyOsLf7wXdnwgEBhXTiamvjz+7C0nK5yMxVA
 ocDwgegVj7975SB8jYdsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668160662; x=
 1668247062; bh=b7XPwc4bj4pQJuvSbD7H9uyA+buey1LxLq7ggZ+S3dQ=; b=V
 O8XvIEzSKRD3P+VLEJnCwZALf2Ce/+l2ZV85fH9Qyc+fZA1QbBI43Z/Kn3CcVta3
 SODi5QVGAQgHnMenUQV94I+WH8WarAeH/9tQa0zd8EgL/x91VVc4bjpwQD8dJ9rc
 SKCyr5NknlVvZ6abbZ8kAwNOxWlOg0zEf3rgQxypOqTDqvDnGnn1DqNsMeVBRYEe
 VYaENgOeqTDA1ApQn3pKedQtPBVnEAafTDF+8naxqbejf2WQRVPs2SAhonNvibQ0
 IH/NewvZ69v92OEhSxz+cuwyyslF8spUQZlsIfgqvcGgHPQ7aADbvQ6Vdlk78yvM
 VZP0dA7RuZn5SCLeca+oQ==
X-ME-Sender: <xms:lhxuY2UGHr_zNh_QYLXdiSdr6yJVlMtBf3dIZ9X1OTP58vaJ8EAXMQ>
 <xme:lhxuYymTmRyntiAb1x4ZpnKYKUjAnPiUtIDfaxwH00K-p7RnPmD4U-LdTSU8wdO4m
 -In60vg9Mff4qNshMY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeigddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:lhxuY6bWxlZJQM_ah-xk5zayo_mM9oaD8SpER4Kxanwhi8R9m2ix1A>
 <xmx:lhxuY9X0bbHfEFKGlMCUv3wABgQ8tiJzW0Ls_DpFTFPuyS3tvfQ3Qg>
 <xmx:lhxuYwlhaPwWxqBJjZr7ho-ma-DULVYkZ2401-OnDN367-Od_5K-7Q>
 <xmx:lhxuY-bO3TPsKdIRISlEq4dWpkIrMJrpd33U6McLpLgSHM2jsfQgsw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 02B5FB60089; Fri, 11 Nov 2022 04:57:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <cd818e0c-4c8c-421e-ae39-c7cea79eeb7e@app.fastmail.com>
In-Reply-To: <CAHJ8P3KU4NBr9ftqp1J_QWxGUjusoUZo6JjefPN-4YazD4mrUQ@mail.gmail.com>
References: <1667889638-9106-1-git-send-email-zhiguo.niu@unisoc.com>
 <202211101659.j9z9jLHv-lkp@intel.com>
 <88fce16b-5092-4246-8bbf-23f2c03224f3@app.fastmail.com>
 <CAHJ8P3+g7dr3PBZFQCD5HQLZ2b0WHe=b6Jt7ha1o7mqZJ7_-BQ@mail.gmail.com>
 <97c529f2-c5a2-4ed6-89eb-c79f020e9d0c@app.fastmail.com>
 <CAHJ8P3KU4NBr9ftqp1J_QWxGUjusoUZo6JjefPN-4YazD4mrUQ@mail.gmail.com>
Date: Fri, 11 Nov 2022 10:57:21 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhiguo Niu" <niuzhiguo84@gmail.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Nov 11, 2022, at 10:40, Zhiguo Niu wrote: > Arnd Bergmann
    <arnd@arndb.de> 于2022年11月10日周四 21:45写道： > I thinks the
   gcc complier build warning : > [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
                             low trust
                             [66.111.4.25 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [66.111.4.25 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1otQnG-0006X2-8w
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: fix atgc bug on issue in 32bits
 platform
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
Cc: llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 "zhiguo.niu" <zhiguo.niu@unisoc.com>, oe-kbuild-all@lists.linux.dev,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBOb3YgMTEsIDIwMjIsIGF0IDEwOjQwLCBaaGlndW8gTml1IHdyb3RlOgo+IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IOS6jjIwMjLlubQxMeaciDEw5pel5ZGo5ZubIDIxOjQ1
5YaZ6YGT77yaCj4gICBJIHRoaW5rcyB0aGUgZ2NjIGNvbXBsaWVyIGJ1aWxkIHdhcm5pbmcgOgo+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiAgICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGZzL2YyZnMvc2VnbWVudC5jOjI0
Ogo+Pj4gZnMvZjJmcy9nYy5oOjczOjE6IHdhcm5pbmc6IGFsaWdubWVudCAxIG9mICdzdHJ1Y3Qg
dmljdGltX2VudHJ5JyBpcyAKPgo+Pj4gbGVzcyB0aGFuIDggWy1XcGFja2VkLW5vdC1hbGlnbmVk
XQo+Cj4gICAgICAgNzMgfCB9IF9fcGFja2VkOwo+Cj4gICAgICAgICAgfCBeCj4KPiAgLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4KPiBJdCBpcyBiZWNhdXNlIHN0cnVjdCByYl9ub2RlIGhhcyB0aGUgYXR0cmlidXRlIAo+ICJf
X2F0dHJpYnV0ZV9fKChhbGlnbmVkKHNpemVvZihsb25nKSIsIGl0IGlzIDggYnl0ZXMgaW4gNjRi
aXRzIHBsYXRmb3JtLgo+Cj4gc3RydWN0IHJiX25vZGUgewo+IHVuc2lnbmVkIGxvbmcgIF9fcmJf
cGFyZW50X2NvbG9yOwo+IHN0cnVjdCByYl9ub2RlICpyYl9yaWdodDsKPiBzdHJ1Y3QgcmJfbm9k
ZSAqcmJfbGVmdDsKPiB9IF9fYXR0cmlidXRlX18oKGFsaWduZWQoc2l6ZW9mKGxvbmcpKSkpOwo+
Cj4gc28gSSBqdXN0IHRyeSB0byBwdXQgX19wYWNrZWQgb24gdW5pb24gb2Ygc3RydWN0IHZpY3Rp
bV9lbnRyeSBhbmQgaSAKPiBhbHNvIGtlZXAgY29uc2lzdGVudCB3aXRoIHN0cnVjdCByYl9lbnRy
eS4KCk5vLCB0aGF0IGF0dHJpYnV0ZSBoYXMgbm8gZWZmZWN0IG9uIGFueSBhcmNoaXRlY3R1cmUg
b3RoZXIKdGhhbiBtNjhrLCB3aGljaCBkZWZhdWx0cyB0byAxNi1iaXQgYWxpZ25tZW50IGZvciAz
Mi1iaXQKbWVtYmVycy4gSSdtIGZhaXJseSBzdXJlIHRoZSBhbGlnbm1lbnQgYXR0cmlidXRlIG9u
CnJiX25vZGUgaXMgZW50aXJlbHkgdW5yZWxhdGVkIHRvIHRoZSBwcm9ibGVtcyB5b3UgYXJlCnNl
ZWluZyBpbiBmMmZzIHRoYXQgY29tZSBmcm9tIGhhdmluZyBhIHN0cnVjdHVyZSB3aXRoCnN0cmlj
dGVyICg0IGJ5dGUgb3IgOCBieXRlKSBhbGlnbm1lbnQgcmVxdWlyZW1lbnRzIGVtYmVkZGVkCmlu
IGEgc3RydWN0dXJlIHdpdGggcmVsYXhlZCAoc2luZ2xlLWJ5dGUpIGFsaWdubWVudDoKCj4gc3Ry
dWN0IHJiX2VudHJ5IHsKPiBzdHJ1Y3QgcmJfbm9kZSByYl9ub2RlOyAvKiByYiBub2RlIGxvY2F0
ZWQgaW4gcmItdHJlZSAqLwo+IHVuaW9uIHsKPiBzdHJ1Y3Qgewo+IHVuc2lnbmVkIGludCBvZnM7
IC8qIHN0YXJ0IG9mZnNldCBvZiB0aGUgZW50cnkgKi8KPiB1bnNpZ25lZCBpbnQgbGVuOyAvKiBs
ZW5ndGggb2YgdGhlIGVudHJ5ICovCj4gfTsKPiB1bnNpZ25lZCBsb25nIGxvbmcga2V5OyAvKiA2
NC1iaXRzIGtleSAqLwo+IH0gX19wYWNrZWQ7Cj4gfTsKClRoaXMgdGVsbHMgdGhlIGNvbXBpbGVy
IHRoYXQgdGhlIGFub255bW91cyB1bmlvbiBpcyAKZW50aXJlbHkgdW5jb25zdHJhaW5lZCwgYnV0
IHRoZSBhbm9ueW1vdXMgc3RydWN0IGluc2lkZQppdCBoYXMgdGhlIGRlZmF1bHQgYWxpZ25tZW50
LCB3aGljaCBpcyB0aGUgY29udHJhZGl0aW9uCnRoYXQgZ2NjIGNvcnJlY3RseSB3YXJucyBhYm91
dC4KClNpbmNlIHRoZSBvbmx5IHRoaW5nIHlvdSBuZWVkIGhlcmUgaXMgdG8gbG93ZXIgdGhlCmFs
aWdubWVudCBjb25zdHJhaW50IGZyb20gOCBieXRlcyB0byA0IGJ5dGVzLCB0aGUgZWFzaWVzdAp3
YXkgaXMgdG8gaGF2ZSB0aGUgX19wYWNrZWQgYW5ub3RhdGlvbiBvbiB0aGUgJ2tleScKbWVtYmVy
LiBUaGlzIGF2b2lkcyBhbGwgd2FybmluZ3MsIGFzIGxvbmcgeW91IGRvIG5vdAp0YWtlIHRoZSBh
ZGRyZXNzIG9mIHRoZSAna2V5JyBtZW1iZXIgYW5kIHBhc3MgaXQgdG8KYSBmdW5jdGlvbiB0aGF0
IGV4cGVjdHMgYW4gYWxpZ25lZCAndTY0JyBwb2ludGVyLgoKICAgICBBcm5kCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
