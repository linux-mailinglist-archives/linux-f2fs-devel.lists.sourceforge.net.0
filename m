Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4553293C6DD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2024 17:56:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sX0pY-0006Jp-Qf;
	Thu, 25 Jul 2024 15:56:36 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <arnd@arndb.de>) id 1sX0pX-0006Jh-3u
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 15:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:Cc:
 To:From:Date:References:In-Reply-To:Message-Id:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SH2QsIwdxGEwvXnuqvyw/+HD9jOx3EvErodiIHyLnIE=; b=IrZoxY5bAR8GXsBsvzBOpoQf7J
 /7/bqb+5s6G2GW6xZsytXZuIqt+Q+dbbHMmHaxEYgjJsztdA8SjvTBU1lGv+EGBEqFlSu67PfzYn+
 kUfL1c2J3oIUQoQrkmF3uKk66RKryqbOdgtwsq58qBIxw5D9uihGktvcwUnrFz0V5JNU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:Cc:To:From:Date:References
 :In-Reply-To:Message-Id:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SH2QsIwdxGEwvXnuqvyw/+HD9jOx3EvErodiIHyLnIE=; b=dk8dTFQgXfIPmb1GmNUs17hhsC
 uM9Wqm4Z3/62Fr9DQRnfknEyVQe6xVXyF1W/4PSZApPSyq3r8Uie4Q5I6aa1092Yc87jetMDu3nmO
 iI7x81NBNwMwLiAFUDeCXHNEqO4Fjxa3onEntI9ewziCV2w08xZUVIJSDFuQMWsSi1Sg=;
Received: from fhigh4-smtp.messagingengine.com ([103.168.172.155])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sX0pV-0002WG-L2 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 15:56:34 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 9A68811401F9;
 Thu, 25 Jul 2024 11:31:21 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute4.internal (MEProxy); Thu, 25 Jul 2024 11:31:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1721921481;
 x=1722007881; bh=SH2QsIwdxGEwvXnuqvyw/+HD9jOx3EvErodiIHyLnIE=; b=
 AsoACoRhcJpNk1G2Ie/w5Db0mrpEH7bVkMaqvotJq6aNTS72PDERWycZ6/9oxdUF
 T78xaWaFifaFbhnWKLDkBrwaCuuouLBY1ZMAI4sr4sGquAemJyGvIyoxkwIMzwB8
 IJADDWMULQ2e+Zf7v9pOCio3I7qGUMOdm6BL4cs8TI98qX5RhlWHR400ut+2HKL/
 ysxEijoHjVqcBBdsuNmGjvACmAsGvgZf2ePB1vvW5lXx73l9hmmTx0J4sWbF9nq5
 LYMp5S5GmSMOfgRrptXB8nxX/Kd8SFXol9skC8EQAjWi/egT5Cs6giZXIM+XRhbH
 VkDGOwEtG/FA4IHW8FcrTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1721921481; x=
 1722007881; bh=SH2QsIwdxGEwvXnuqvyw/+HD9jOx3EvErodiIHyLnIE=; b=u
 59KnImr5u7plQjCm5IdkuXjwp7Yg5w5qU1lAeJC9rRpyBmQYvOnpyWptgl5C/BQI
 4fs7rQLpJ4lnlznMxXIqsaNCSw5khKJnxuuDIyPUELSlipT7N1wcAJX/8IG0SkFN
 5hCDrkxVBeoTJHoUTIbWVLqC1Vk5zbmy2auDAYrx74nEgdFOHhDSm1POUPg2onyi
 yaJ+/pGtiLieoFksCTekqnXlUGGgd6i00ZCqdUjJrB0XyQFecqG7DXLyeClrON9f
 cam0xe25g+Vq++2Nt0Xh2V99St2Td8aoNrEfsDIAeLFfwtnLt3YuZVPytZzMQDhf
 F9kg196C2Zk2/S4VS/EVg==
X-ME-Sender: <xms:yG-iZphKtVbvGeOra7bx7_P00WK7AJ1N69H7OkBzwxPLQkutlAqBAw>
 <xme:yG-iZuBuS6hA-oRNqknuvPN0fwDH2yAjvromFeTmHmqO3BzwylC7kDy80tLoKIaN8
 NcYDDeJe1sabbxUVxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrieefgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:yG-iZpHNm9tchrmE9bJF1DcsnXEzL6Amsc7aFYo53az5BN5AVn_YXg>
 <xmx:yG-iZuQ4lgBYBlNmGyNXtRPCgk6MPlrAMIg8jNUEPRHm7yZH-VS-Kw>
 <xmx:yG-iZmzVhp2U5gM4RXhKAMfji2rXp3FRTVHsghjm4KoDHm2DuSEASA>
 <xmx:yG-iZk6Dnh53-LHldUTZ5cpmQKq7GFuUL5bLrHFFiHiIzPQjSszb3Q>
 <xmx:yW-iZrh4M8MuFBJArq-ve0DQb30ZD5adlHyKr7qa1nrEfOYdYv2J8WhV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 89CFFB60098; Thu, 25 Jul 2024 11:31:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-582-g5a02f8850-fm-20240719.002-g5a02f885
MIME-Version: 1.0
Message-Id: <61beb54b-399b-442d-bfdb-bad23cefa586@app.fastmail.com>
In-Reply-To: <ZqJjsg3s7H5cTWlT@infradead.org>
References: <20240723083239.41533-1-youling.tang@linux.dev>
 <20240723083239.41533-2-youling.tang@linux.dev>
 <Zp-_RDk5n5431yyh@infradead.org>
 <0a63dfd1-ead3-4db3-a38c-2bc1db65f354@linux.dev>
 <ZqEhMCjdFwC3wF4u@infradead.org>
 <895360e3-97bb-4188-a91d-eaca3302bd43@linux.dev>
 <ZqJjsg3s7H5cTWlT@infradead.org>
Date: Thu, 25 Jul 2024 17:30:58 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christoph Hellwig" <hch@infradead.org>,
 "Youling Tang" <youling.tang@linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Jul 25, 2024, at 16:39, Christoph Hellwig wrote: >
    On Thu, Jul 25, 2024 at 11:01:33AM +0800, Youling Tang wrote: >> - It doesn't
    feel good to have only one subinit/exit in a file. >>   Assumi [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: messagingengine.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [103.168.172.155 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                           [103.168.172.155 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [103.168.172.155 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1sX0pV-0002WG-L2
Subject: Re: [f2fs-dev] [PATCH 1/4] module: Add module_subinit{_noexit} and
 module_subeixt helper macros
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 Youling Tang <tangyouling@kylinos.cn>, linux-f2fs-devel@lists.sourceforge.net,
 Theodore Ts'o <tytso@mit.edu>, Josef Bacik <josef@toxicpanda.com>,
 linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-btrfs@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBKdWwgMjUsIDIwMjQsIGF0IDE2OjM5LCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToK
PiBPbiBUaHUsIEp1bCAyNSwgMjAyNCBhdCAxMTowMTozM0FNICswODAwLCBZb3VsaW5nIFRhbmcg
d3JvdGU6Cj4+IC0gSXQgZG9lc24ndCBmZWVsIGdvb2QgdG8gaGF2ZSBvbmx5IG9uZSBzdWJpbml0
L2V4aXQgaW4gYSBmaWxlLgo+PiDCoCBBc3N1bWluZyB0aGF0IHRoZXJlIGlzIG9ubHkgb25lIGZp
bGUgaW4gZWFjaCBmaWxlLCBob3cgZG8gd2UKPj4gwqAgZW5zdXJlIHRoYXQgdGhlIGZpbGVzIGFy
ZSBsaW5rZWQgaW4gb3JkZXI/KElzIGl0IHNvcnRlZCBieSAqLm8KPj4gwqAgaW4gdGhlIE1ha2Vm
aWxlPykKPgo+IFllcywgbGluayBvcmRlciBhbHJlYWR5IG1hdHRlcm5zIGZvciBpbml0aWFsaXph
dGlvbiBvcmRlciBmb3IgYnVpbHQtaW4KPiBjb2RlLCBzbyB0aGlzIGlzIGEgd2VsbCBrbm93biBj
b25jZXB0LgoKTm90ZTogSSByZW1vdmVkIHRoZSBvbGQgd2F5IG9mIGVudGVyaW5nIGEgbW9kdWxl
IGEgZmV3CnllYXJzIGFnbywgd2hpY2ggYWxsb3dlZCBzaW1wbHkgZGVmaW5pbmcgYSBmdW5jdGlv
biBjYWxsZWQKaW5pdF9tb2R1bGUoKS4gVGhlIGxhc3Qgb25lIG9mIHRoZXNlIHdhcyBhMDdkOGVj
ZjZiMzkKKCJldGhlcm5ldDogaXNhOiBjb252ZXJ0IHRvIG1vZHVsZV9pbml0L21vZHVsZV9leGl0
IikuCgpOb3cgSSB0aGluayB3ZSBjb3VsZCBqdXN0IG1ha2UgdGhlIG1vZHVsZV9pbml0KCkgbWFj
cm8KZG8gdGhlIHNhbWUgdGhpbmcgYXMgYSBidWlsdC1pbiBpbml0Y2FsbCgpIGFuZCBwdXQKYW4g
ZW50cnkgaW4gYSBzcGVjaWFsIHNlY3Rpb24sIHRvIGxldCB5b3UgaGF2ZSBtdWx0aXBsZQplbnRy
eSBwb2ludHMgaW4gYSBsb2FkYWJsZSBtb2R1bGUuCgpUaGVyZSBhcmUgc3RpbGwgYXQgbGVhc3Qg
dHdvIHByb2JsZW1zIHRob3VnaDoKCi0gd2hpbGUgbGluayBvcmRlciBpcyBkZWZpbmVkIGJldHdl
ZW4gZmlsZXMgaW4gYSBtb2R1bGUsCiAgSSBkb24ndCB0aGluayB0aGVyZSBpcyBhbnkgZ3VhcmFu
dGVlIGZvciB0aGUgb3JkZXIgYmV0d2VlbgogIHR3byBpbml0Y2FsbHMgb2YgdGhlIHNhbWUgbGV2
ZWwgd2l0aGluIGEgc2luZ2xlIGZpbGUuCgotIEZvciBidWlsdC1pbiBjb2RlIHdlIGRvbid0IGhh
dmUgdG8gd29ycnkgYWJvdXQgbWF0Y2hpbmcKICB0aGUgb3JkZXIgb2YgdGhlIGV4aXQgY2FsbHMg
c2luY2UgdGhleSBkb24ndCBleGlzdCB0aGVyZS4KICBBcyBJIHVuZGVyc3RhbmQsIHRoZSBpbnRl
cmVzdGluZyBwYXJ0IG9mIHRoaXMgcGF0Y2gKICBzZXJpZXMgaXMgYWJvdXQgbWFraW5nIHN1cmUg
dGhlIG9yZGVyIG1hdGNoZXMgYmV0d2VlbgogIGluaXQgYW5kIGV4aXQsIHNvIHRoZXJlIHN0aWxs
IG5lZWRzIHRvIGJlIGEgd2F5IHRvCiAgZXhwcmVzcyBhIHBhaXIgb2Ygc3VjaCBjYWxscy4KCiAg
ICAgQXJuZAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
