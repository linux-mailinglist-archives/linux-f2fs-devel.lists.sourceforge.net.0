Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FF5A3B74
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2019 18:06:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3jQI-0005ZN-NL; Fri, 30 Aug 2019 16:06:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <postmaster@win16.hostnetcom.com>) id 1i3jQG-0005ZE-8Q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Aug 2019 16:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LSNasqk8aBWAxnt3LOIIpyvKHIogCYCQ0ACdGfsPOJo=; b=ZidUvsAUuQa6swVGEYS33COqwS
 x8IAvRmUOE9dzYODCbIYm0kcPr+xktrFPPRsEnS4RGdwSAbSFbS47pnikf3Jnr882CgFNNSYNip9S
 ASN8e4Mlc2zmrar02lORMAbqlH+Zuap+W3N6z/m+OmrLh8jLohJn3Y70hvZBko2jbpC0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LSNasqk8aBWAxnt3LOIIpyvKHIogCYCQ0ACdGfsPOJo=; b=E
 GwvzxWmzi2hCNGt9S3ADRTEBGgUd6ObFe9YrlEPS1iTKrbJe0oAlQ5E2iHacEKKKfUNg1l5NujwDq
 0Lq1INwESvRQ75cxQpLOh8zVOT+yLtHOgckh4r7WCypgljHLIK1g2Y/KY5frVV25et5IVoA4k8h1A
 x4nrut044TBlJac8=;
Received: from mail11.b2web.com.ve ([173.193.137.1] helo=linux11.b2web.com.ve)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i3jQE-009SGi-AT
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Aug 2019 16:06:48 +0000
Received: from win16.hostnetcom.com ([209.208.65.150]:55201)
 by linux11.b2web.com.ve with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
 (Exim 4.91) (envelope-from <postmaster@win16.hostnetcom.com>)
 id 1i3jQ7-00074k-O6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Aug 2019 12:06:40 -0400
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on Win16cloud
X-Spam-Level: *******
Received: from win16.hostnetcom.com ([93.89.190.250]) by win16.hostnetcom.com
 with MailEnable ESMTPA; Fri, 30 Aug 2019 05:26:16 -0400
From: Mrs. Elspeth Norman Scoular postmaster@win16.hostnetcom.com
To: linux-f2fs-devel@lists.sourceforge.net
Date: 30 Aug 2019 12:26:14 +0300
Message-ID: <20190830122614.E8E49656A069958A@win16.hostnetcom.com>
MIME-Version: 1.0
X-Spam-Prev-Subject: Security Keeping Code of Your Package(ENS/0148/U)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - linux11.b2web.com.ve
X-AntiAbuse: Original Domain - lists.sourceforge.net
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - win16.hostnetcom.com
X-Get-Message-Sender-Via: linux11.b2web.com.ve: mailgid no entry from
 get_recent_authed_mail_ips_entry
X-Authenticated-Sender: linux11.b2web.com.ve: 
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Score: 8.3 (++++++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: independent.co.uk]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [173.193.137.1 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 LOTS_OF_MONEY          Huge... sums of money
 2.0 HK_SCAM                No description available.
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
 0.0 FILL_THIS_FORM         Fill in a form with personal information
 0.6 MONEY_FORM             Lots of money if you fill out a form
 3.1 MONEY_FRAUD_8          Lots of money and very many fraud phrases
 0.1 ADVANCE_FEE_5_NEW_FRM_MNY Advance Fee fraud form and lots of money
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1i3jQE-009SGi-AT
Subject: [f2fs-dev] [SPAM] ***SPAM*** Security Keeping Code of Your
 Package(ENS/0148/U)
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
Reply-To: mrrobertperry@mail2london.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

TXkgRGVhciwKCkkgYW0gc3VyZSB0aGlzIG1haWwgd291bGQgYmUgY29taW5nIHRvIHlvdSBhcyBh
IHN1cnByaXNlIHNpbmNlIHdlIApoYXZlIG5ldmVyIG1ldCBiZWZvcmUgYW5kIHlvdSB3b3VsZCBh
bHNvIGJlIGFza2luZyB3aHkgSSBoYXZlIApkZWNpZGVkIHRvIGNob3NlIHlvdSBhbW9uZ3N0IHRo
ZSBudW1lcm91cyBpbnRlcm5ldCB1c2VycyBpbiB0aGUgCndvcmxkLCBwcmVjaXNlbHkgSSBjYW5u
b3Qgc2F5IHdoeSBJIGhhdmUgY2hvc2VuIHlvdSBidXQgZG8gbm90IGJlIAp3b3JyaWVkIGZvciBJ
IGNvbWUgaW4gcGVhY2UgYW5kIHNvbWV0aGluZyB2ZXJ5IHBvc2l0aXZlIGlzIGFib3V0IAp0byBo
YXBwZW4gdG8geW91ciBsaWZlIHJpZ2h0IG5vdyBhbmQgdG8gdGhlIGxpdmVzIG9mIG90aGVycyAK
dGhyb3VnaCB5b3UgaWYgb25seSB5b3UgY2FuIGNhcmVmdWxseSByZWFkIGFuZCBkaWdlc3QgdGhl
IG1lc3NhZ2UgCmJlbG93LiBUaGUgaW50ZXJuZXQgaGFzIG1hZGUgdGhlIHdvcmxkIGdsb2JhbCB2
aWxsYWdlcyB3aGVyZSB5b3UgCmNhbiByZWFjaCBhbnlib2R5IHlvdSBoYXZlIG5vdCBtZXQgYmVm
b3JlLgoKQmVmb3JlIEkgbW92ZSBmdXJ0aGVyLCBwZXJtaXQgbWUgdG8gZ2l2ZSB5b3UgYSBsaXR0
bGUgb2YgbXkgCmJpb2dyYXBoeSwgSSBhbSBNcnMuIEVsc3BldGggTm9ybWFuIFNjb3VsYXIsIDc4
IFllYXJzIG9sZCB3b21hbiAKYW5kIHRoZSB3aWZlIG9mIExhdGUgU2lyIE5vcm1hbiBTY291bGFy
IHdobyBkaWVkIGluIGEgUGxhbmUgY3Jhc2ggCm9uIE1vbmRheSB0aGUgN3RoIG9mIFNlcHRlbWJl
ciAxOTk4IEdNVCAxNDoyMiBVSyB3aGlsZSB0aGV5IHdlcmUgCmZseWluZyBmcm9tIE5ldyBZb3Jr
IHRvIEdlbmV2YS4gUGxlYXNlIHNlZSBzaXRlIGJlbG93IGZvciBtb3JlIAppbmZvcm1hdGlvbi4g
CgpodHRwOi8vd3d3LmNubi5jb20vV09STEQvOTgwOS9zd2lzc2Fpci52aWN0aW1zLmxpc3QvaW5k
ZXguaHRtbApodHRwczovL3d3dy5pbmRlcGVuZGVudC5jby51ay9uZXdzL3JlbGF0aXZlcy1ncmll
dmUtZm9yLXNpeC1icml0b25zLXdoby1kaWVkLTExOTU5NzUuaHRtbAoKQWZ0ZXIgdGhlIGRlYXRo
IG9mIG15IGh1c2JhbmQgSSBiZWNhbWUgdGhlIEhlYWQgb2YgaGlzIGludmVzdG1lbnQgCmFuZCBu
b3cgdGhhdCBJIGFtIG9sZCBhbmQgd2VhayBJIGhhdmUgZGVjaWRlZCB0byBzcGVuZCB0aGUgcmVz
dCAKb2YgbXkgbGlmZSB3aXRoIG15IGZhbWlseSBhbmQgbG92ZWQgb25lcyB3aG9tIEkgbmV2ZXIg
aGFkIHRpbWUgCmZvciBkdXJpbmcgdGhlIGNvdXJzZSBvZiBteSBidXNpbmVzcyBsaWZlLCBidXQg
YmVmb3JlIHRoZSBkZWF0aCAKb2YgbXkgaHVzYmFuZCB3ZSBoYWQgYSBwbGFuIHRvIHVzZSB0aGUg
bGFzdCBkYXlzIG9mIG91ciBsaXZlcyB0byAKZG9uYXRlIGhhbGYgb2Ygd2hhdCB3ZSBoYXZlIHdv
cmtlZCBmb3IgdG8gdGhlIGxlc3MgcHJpdmlsZWdlIGFuZCAKY2hhcml0eSBob21lcyBhbmQgdGhl
IG90aGVyIGhhbGYgZm9yIG91cnNlbHZlcywgZmFtaWx5IG1lbWJlcnMgCmFuZCBjbG9zZSBmcmll
bmRzLCBhbmQgaXQgaXMgc28gdW5mb3J0dW5hdGUgdGhhdCBteSBodXNiYW5kIGlzIApub3QgYWxp
dmUgdG9kYXkgdG8gZG8gdGhpcyB3aXRoIG1lLCBoZW5jZSBJIGhhdmUgZGVjaWRlZCB0byBkbyAK
dGhpcyBwaGlsYW50aHJvcGljIHdvcmsgb24gYmVoYWxmIG9mIG15IGxhdGUgaHVzYmFuZCBhbmQg
SS4KClByZXNlbnRseSwgSSBoYXZlIHdpbGxlZCBvdXQgYWxtb3N0IGhhbGYgb2Ygb3VyIGFzc2V0
cyB0byBzZXZlcmFsIApjaGFyaXR5IGhvbWVzIGFuZCB0byBzb21lIG9mIHRoZSBsZXNzIHByaXZp
bGVnZSBpbiBkaWZmZXJlbnQgCmNvdW50cmllcy4gRGVzcGl0ZSB0aGUgYWdyZWVtZW50IGJldHdl
ZW4gbXkgbGF0ZSBodXNiYW5kIGFuZCBJIHRvIApnaXZlIGFpZCB0byB0aGUgZGVwcml2ZWQsIHdl
IGFsc28gYWdyZWVkIHRvIHJlbmRlciBzdXBwb3J0IHRvIGFuIAppbmRpdmlkdWFsIHdlIGhhdmUg
bm90IG1lZXQgYmVmb3JlIGluIGxpZmUgZHVlIHRvIHRoZSBmYWN0IHdoZW4gCndlIHdlcmUgc3Rp
bGwgeW91bmcgaW4gbGlmZSB3ZSByZWNlaXZlIGFuIGFub255bW91cyBoZWxwIGZyb20gYW4gCmlu
ZGl2aWR1YWwgd2UgZGlkIG5vdCBrbm93IGFuZCB3aGljaCB3ZSBoYXZlIG5vdCBiZWluZyBhYmxl
IHRvIAprbm93IHRpbGwgZGF0ZSwgdGhlIGltcGFjdCB3ZSBnb3QgZnJvbSBzdWNoIGdlc3R1cmUg
bWFkZSB1cyB0byBkbyAKc2FtZS4KCkkgYW0gc29ycnkgdG8gaW5mb3JtIHlvdSB0aGF0IHlvdSB3
aWxsIG5ldmVyIGhhdmUgdGhlIGNoYW5jZSB0byAKa25vdyBtZSBiZWNhdXNlIEkgaGF2ZSBqdXN0
IGNvbmNsdWRlZCB0aGUgYXNzaWdubWVudCB3aGljaCBteSAKaHVzYmFuZCBhbmQgSSBoYXZlIGFn
cmVlZCB1cG9uIGJlZm9yZSBoaXMgc3VkZGVuIGRlYXRoIGFuZCB5b3UgCmhhcHBlbmVkIHRvIGJl
IHRoZSBiZW5lZmljaWFyeSBvZiBvdXIgbGFzdCBXSUxMLCBpcnJlc3BlY3RpdmUgb2YgCnlvdXIg
cHJldmlvdXMgZmluYW5jaWFsIHN0YXR1cywgaGVuY2UgSSBuZWVkIHlvdSB0byBkbyBtZSBhIGZh
dm9yIApieSBhY2NlcHRpbmcgb3VyIG9mZmVyIHRoYXQgd2lsbCBjb3N0IHlvdSBub3RoaW5nLgoK
SSBoYXZlIHByZXNlbnRseSBkZXBvc2l0ZWQgYSBDaGVxdWUgaW4gdGhlIHN1bSBvZiA1MDAsMDAw
LjAwIApCcml0aXNoIFBvdW5kcyB3aXRoIERITCBleHByZXNzIHRvIGRlbGl2ZXIgdG8geW91LCB3
aGF0IHlvdSBoYXZlIAp0byBkbyBub3cgaXMgdG8gY29udGFjdCB0aGUgREhMIENPVVJJRVIgU0VS
VklDRSBhcyBzb29uIGFzIApwb3NzaWJsZSB0byBrbm93IHdoZW4gdGhleSB3aWxsIGRlbGl2ZXIg
eW91ciBwYWNrYWdlIHRvIHlvdSAKYmVjYXVzZSBvZiB0aGUgZXhwaXJpbmcgZGF0ZS4KCkZvciB5
b3VyIGluZm9ybWF0aW9uLCBJIGhhdmUgcGFpZCBmb3IgdGhlIGRlbGl2ZXJpbmcgQ2hhcmdlLCAK
SW5zdXJhbmNlIFByZW1pdW0gYW5kIENsZWFyYW5jZSBDZXJ0aWZpY2F0ZSBGZWUgb2YgdGhlIENo
ZXF1ZSAKc2hvd2luZyB0aGF0IGl0IGlzIG5vdCBhIERydWcgTW9uZXkgb3IgbWVhbnQgdG8gc3Bv
bnNvciBUZXJyb3Jpc3QgCmF0dGFjayBpbiB5b3VyIENvdW50cnkKCllvdSBoYXZlIHRvIGNvbnRh
Y3QgdGhlIERITCBDT1VSSUVSIFNFUlZJQ0Ugbm93IGZvciB0aGUgZGVsaXZlcnkgCm9mIHlvdXIg
Y2hlcXVlIHdpdGggdGhpcyBpbmZvcm1hdGlvbiBiZWxsb3c7CgpDb250YWN0IFBlcnNvbjogTXIu
IFJvYmVydCBQZXJyeS4KCkVtYWlsIEFkZHJlc3M6ICAKbXJyb2JlcnRwZXJyeUBtYWlsMmxvbmRv
bi5jb20vbXIucm9iZXJ0cGVycnlAaG90bWFpbC5jb20KClRlbGw6ICArNDQgNzkzNyAgNDM3IDEz
MQogICAgICAgICAgICAgICAgICAgIApBZ2FpbiwgeW91IGFyZSBub3QgdG8gcGF5IGZvciB0aGUg
ZGVsaXZlcmluZyBDaGFyZ2UsIHRoZSAKSW5zdXJhbmNlIHByZW1pdW0gYW5kIHRoZSBDbGVhcmFu
Y2UgQ2VydGlmaWNhdGUgRmVlIG9mIHRoZSBDaGVxdWUgCmJlY2F1c2UgSSBoYXZlIGFscmVhZHkg
cGFpZCBmb3IgdGhlbSwgdGhlIG9ubHkgbW9uZXkgeW91IGFyZSAKZXhwZWN0ZWQgdG8gcGF5IGlz
IDU4MyBCcml0aXNoIFBvdW5kcyBmb3IgdGhlIHNlY3VyaXR5IGtlZXBpbmcgb2YgCnRoZSBjaGVx
dWUgc28gZmFyLgoKSSB3b3VsZCBoYXZlIHBhaWQgdGhlIGZlZSBidXQgdGhlIGNvbXBhbnkgaW5z
aXN0ZWQgdGhhdCBJIHNob3VsZCAKbm90IGJlY2F1c2UgdGhleSBkb24ndCBrbm93IHdoZW4geW91
IHdpbGwgYmUgY29udGFjdGluZyB0aGVtIGFuZCAKdG8gYXZvaWQgZGVtdXJyYWdlIG9yIGZ1cnRo
ZXIgY29zdC4KCllvdSBhcmUgdG8gcmVjb25maXJtIHRoZSBiZWxvdyBpbmZvcm1hdGlvbiB0byB0
aGVtIHRvIGF2b2lkIGFueSAKbWlzdGFrZSBvbiB0aGUgRGVsaXZlcnkuCgpQb3N0YWwgYWRkcmVz
czsKRnVsbCBOYW1lczoKRGlyZWN0IHRlbGVwaG9uZSBudW1iZXI7CgpCZWxvdyBpcyB0aGUgc2Vj
dXJpdHkga2VlcGluZyBjb2RlOiAoRU5TLzAxNDgvVSkgb2YgeW91ciBkcmFmdCwgCnlvdSBhcmUg
dG8gYWxzbyBwcmVzZW50IGl0IHRvIHRoZW0gZm9yIHZlcmlmaWNhdGlvbiBiZWZvcmUgCmRlbGl2
ZXJ5LgoKTGV0IG1lIHJlcGVhdCBhZ2FpbiwgdHJ5IHRvIGNvbnRhY3QgdGhlbSBhcyBzb29uIGFz
IHlvdSByZWNlaXZlIAp0aGlzIG1haWwgdG8gYXZvaWQgYW55IGZ1cnRoZXIgZGVsYXkgYW5kIHJl
bWVtYmVyIHRvIGFzayB0aGVtIHRvIApwcm92aWRlIHlvdSB3aXRoIHRoZSBtZXRob2QgdGhleSB3
aXNoIHRvIHVzZSBpbiByZWNlaXZpbmcgdGhlaXIgCnNlY3VyaXR5IGtlZXBpbmcgZmVlIG9mIDU4
MyBCcml0aXNoIFBvdW5kcyBmb3IgdGhlaXIgaW1tZWRpYXRlIAphY3Rpb24uCgpOb3RlOiBQbGVh
c2UgSSBkbyBub3Qgd2FudCB5b3UgdG8gdGhhbmsgbWUgb3IgbXkgaHVzYmFuZCBhbGwgSSAKbmVl
ZCB5b3UgdG8gZG8gaXMgdG8gaW52ZXN0IHdpc2VseSB3aXRoIGl0IGFuZCBkbyB0aGUgc2FtZSBn
b29kIAp0byBzb21lb25l4oCZcyBsaWZlIHNvbWVkYXkgYXMgdGhpcyBpcyB0aGUgb25seSB3YXkg
dGhpcyB3b3JsZCAKd291bGQgYmUgYSBiZXR0ZXIgY29tbXVuaXR5IGlmIHdlIHJlbmRlciBzZWxm
bGVzcyBzZXJ2aWNlcyB0byBvbmUgCmFub3RoZXIuCgpZb3VycyBGYWl0aGZ1bGx5LApNcnMuIEVs
c3BldGggTm9ybWFuIFNjb3VsYXIuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
