Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51194AE61B1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jun 2025 12:01:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ts0Jp6bzm7Of4C4VCyy7CJ6j/vYnI1wsHVaxG0GuNZ4=; b=AShwVsl+K1jJKWrYWXHenqsxne
	PzdUyfR/0djwBX+WXDwDYo2H1+0TJ4x0SKjAT1Abt9DQ+LMtmhGZrytsePcVi4UHc4qzGkNLC5FoE
	xTrseKWc+sylzCKtMBKx2ix58/3qp/IYAxesfqFQjhkmshOqT9OXx8t9lDq2ScjvBwc4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uU0SX-0000E5-RC;
	Tue, 24 Jun 2025 10:00:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lee@kernel.org>) id 1uU0SP-0000Do-P9
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 10:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OY/Jvbfhn3GjUvoKXeFhePZgvU2H+SLZV7Qgp0nRtV8=; b=XAUPzcemsjrV0vQ2YqGV0QjF/h
 ng0KqaN82Epdcoxt5pPzqqBLewBshVSBeBtgVRk95lYAvz1zVLVLAk+bAf0V4YTcyFknkDaiRYhsJ
 D95fG0YuCqUQnTawgJ9tXAbC/YRxMCT8G+H99kn5+EienSlZYt2oQnUftqvRRnThiuA8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OY/Jvbfhn3GjUvoKXeFhePZgvU2H+SLZV7Qgp0nRtV8=; b=WH+OO9CZtZpVlyXtVIIhG1HYcn
 cbGJ8TFJbNXzxMpShf5F68siY1fyulXVd7zrjGblZNuxO+CH0A3JhGXMfNI8WmhfyPyXXsHXO6u8m
 uJeJk+pBHYgsbCHQ5EmlLQpXxjrAhsLj+6kt6BlXq7WbhTOAS+G4B566nuoBgzKn76yU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uU0SP-0004tH-1F for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 10:00:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A0BE043C15;
 Tue, 24 Jun 2025 10:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A916C4CEE3;
 Tue, 24 Jun 2025 10:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750759243;
 bh=BqpHavQ/lw1T1YQNn8lbODhWv9axsKn/Q1NKE5nNQW8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fe3QzChPa0+w5DS3WDMm74d1nZ369WNmw5CsWx7cro2n7JB28Ay5n5AFg+TAV1Z0N
 bwksq4op1CDur52yktBYVmQVk7g9QY9dMm1Zdi/HJQ0lyDc0o3Nk4dkPtqzCInNoP6
 e4O1UNNvEjioFAZj3FgmsyLDSSRce9eXplanLAqRQ9e95xK55TstVJUnY0sX/sd6eR
 3qsJ0WhI7RwAO1IsLHGgtfRea6Z0YNqS2ErV3EbfQlJ89Qp8I0fn9AwdvWgcN3FSie
 rOKnd2+jihZlV5tlSivRrt4zjSVSRse03XDcSGyFPb69U6PCyrAnLWN1gvK63aZHRS
 ITnnm63uArKCw==
Date: Tue, 24 Jun 2025 11:00:39 +0100
To: Chao Yu <chao@kernel.org>, stable@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
Message-ID: <20250624100039.GA3680448@google.com>
References: <20250416054805.1416834-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250416054805.1416834-1-chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 16 Apr 2025, Chao Yu wrote: > This patch adds a new
 sysfs entry /sys/fs/f2fs/<disk>/encoding_flags, > it is a read-only entry
 to show the value of sb.s_encoding_flags, the > value is hexadecimal. > >
 =========================== [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uU0SP-0004tH-1F
Subject: [f2fs-dev] [STABLE 5.15+] f2fs: sysfs: add encoding_flags entry
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
From: Lee Jones via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Lee Jones <lee@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCAxNiBBcHIgMjAyNSwgQ2hhbyBZdSB3cm90ZToKCj4gVGhpcyBwYXRjaCBhZGRzIGEg
bmV3IHN5c2ZzIGVudHJ5IC9zeXMvZnMvZjJmcy88ZGlzaz4vZW5jb2RpbmdfZmxhZ3MsCj4gaXQg
aXMgYSByZWFkLW9ubHkgZW50cnkgdG8gc2hvdyB0aGUgdmFsdWUgb2Ygc2Iuc19lbmNvZGluZ19m
bGFncywgdGhlCj4gdmFsdWUgaXMgaGV4YWRlY2ltYWwuCj4gCj4gPT09PT09PT09PT09PT09PT09
PT09PT09PT09ICAgICAgPT09PT09PT09PQo+IEZsYWdfTmFtZSAgICAgICAgICAgICAgICAgICAg
ICAgIEZsYWdfVmFsdWUKPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT0gICAgICA9PT09PT09
PT09Cj4gU0JfRU5DX1NUUklDVF9NT0RFX0ZMICAgICAgICAgICAgMHgwMDAwMDAwMQo+IFNCX0VO
Q19OT19DT01QQVRfRkFMTEJBQ0tfRkwgICAgIDB4MDAwMDAwMDIKPiA9PT09PT09PT09PT09PT09
PT09PT09PT09PT0gICAgICA9PT09PT09PT09Cj4gCj4gY2FzZSMxCj4gbWtmcy5mMmZzIC1mIC1P
IGNhc2Vmb2xkIC1DIHV0Zjg6c3RyaWN0IC9kZXYvdmRhCj4gbW91bnQgL2Rldi92ZGEgL21udC9m
MmZzCj4gY2F0IC9zeXMvZnMvZjJmcy92ZGEvZW5jb2RpbmdfZmxhZ3MKPiAxCj4gCj4gY2FzZSMy
Cj4gbWtmcy5mMmZzIC1mIC1PIGNhc2Vmb2xkIC1DIHV0ZjggL2Rldi92ZGEKPiBmc2NrLmYyZnMg
LS1ub2xpbmVhci1sb29rdXA9MSAvZGV2L3ZkYQo+IG1vdW50IC9kZXYvdmRhIC9tbnQvZjJmcwo+
IGNhdCAvc3lzL2ZzL2YyZnMvdmRhL2VuY29kaW5nX2ZsYWdzCj4gMgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9BQkkv
dGVzdGluZy9zeXNmcy1mcy1mMmZzIHwgMTMgKysrKysrKysrKysrKwo+ICBmcy9mMmZzL3N5c2Zz
LmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOSArKysrKysrKysKPiAgMiBmaWxlcyBjaGFu
Z2VkLCAyMiBpbnNlcnRpb25zKCspCgpUaGlzIHBhdGNoLCBjb21taXQgNjE3ZTA0OTFhYmU0ICgi
ZjJmczogc3lzZnM6IGV4cG9ydCBsaW5lYXJfbG9va3VwIGluCmZlYXR1cmVzIGRpcmVjdG9yeSIp
IHVwc3RyZWFtLCBuZWVkcyB0byBmaW5kIGl0cyB3YXkgaW50byBhbGwgU3RhYmxlCmJyYW5jaGVz
IGNvbnRhaW5pbmcgdXBzdHJlYW0gY29tbWl0IDkxYjU4N2JhNzllMSAoImYyZnM6IEludHJvZHVj
ZQpsaW5lYXIgc2VhcmNoIGZvciBkZW50cmllcyIpLCB3aGljaCBpcyBlc3NlbnRpYWxseSBsaW51
eC01LjE1LnkgYW5kCm5ld2VyLgoKc3RhYmxlL2xpbnV4LTUuNC55OgpNSVNTSU5HOiAgICAgZjJm
czogSW50cm9kdWNlIGxpbmVhciBzZWFyY2ggZm9yIGRlbnRyaWVzCk1JU1NJTkc6ICAgICBmMmZz
OiBzeXNmczogZXhwb3J0IGxpbmVhcl9sb29rdXAgaW4gZmVhdHVyZXMgZGlyZWN0b3J5CgpzdGFi
bGUvbGludXgtNS4xMC55OgpNSVNTSU5HOiAgICAgZjJmczogSW50cm9kdWNlIGxpbmVhciBzZWFy
Y2ggZm9yIGRlbnRyaWVzCk1JU1NJTkc6ICAgICBmMmZzOiBzeXNmczogZXhwb3J0IGxpbmVhcl9s
b29rdXAgaW4gZmVhdHVyZXMgZGlyZWN0b3J5CgpzdGFibGUvbGludXgtNS4xNS55OgpiMDkzOGZm
ZDM5YWUgZjJmczogSW50cm9kdWNlIGxpbmVhciBzZWFyY2ggZm9yIGRlbnRyaWVzIFs1LjE1LjE3
OV0KTUlTU0lORzogICAgIGYyZnM6IHN5c2ZzOiBleHBvcnQgbGluZWFyX2xvb2t1cCBpbiBmZWF0
dXJlcyBkaXJlY3RvcnkKCnN0YWJsZS9saW51eC02LjEueToKZGU2MDUwOTdlYjE3IGYyZnM6IElu
dHJvZHVjZSBsaW5lYXIgc2VhcmNoIGZvciBkZW50cmllcyBbNi4xLjEyOV0KTUlTU0lORzogICAg
IGYyZnM6IHN5c2ZzOiBleHBvcnQgbGluZWFyX2xvb2t1cCBpbiBmZWF0dXJlcyBkaXJlY3RvcnkK
CnN0YWJsZS9saW51eC02LjYueToKMGJmMmFkYWQwM2UxIGYyZnM6IEludHJvZHVjZSBsaW5lYXIg
c2VhcmNoIGZvciBkZW50cmllcyBbNi42Ljc2XQpNSVNTSU5HOiAgICAgZjJmczogc3lzZnM6IGV4
cG9ydCBsaW5lYXJfbG9va3VwIGluIGZlYXR1cmVzIGRpcmVjdG9yeQoKc3RhYmxlL2xpbnV4LTYu
MTIueToKMDBkMTk0M2ZlNDZkIGYyZnM6IEludHJvZHVjZSBsaW5lYXIgc2VhcmNoIGZvciBkZW50
cmllcyBbNi4xMi4xM10KTUlTU0lORzogICAgIGYyZnM6IHN5c2ZzOiBleHBvcnQgbGluZWFyX2xv
b2t1cCBpbiBmZWF0dXJlcyBkaXJlY3RvcnkKCm1haW5saW5lOgo5MWI1ODdiYTc5ZTEgZjJmczog
SW50cm9kdWNlIGxpbmVhciBzZWFyY2ggZm9yIGRlbnRyaWVzCjYxN2UwNDkxYWJlNCBmMmZzOiBz
eXNmczogZXhwb3J0IGxpbmVhcl9sb29rdXAgaW4gZmVhdHVyZXMgZGlyZWN0b3J5Cgo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMKPiBiL0RvY3Vt
ZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcyBpbmRleAo+IDU5YWRiN2RjNmY5ZS4u
MGRiZTY4MTNiNzA5IDEwMDY0NCAtLS0KPiBhL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lz
ZnMtZnMtZjJmcyArKysKPiBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJm
cyBAQCAtODQ2LDMgKzg0NiwxNiBAQAo+IERlc2NyaXB0aW9uOglGb3Igc2V2ZXJhbCB6b25lZCBz
dG9yYWdlIGRldmljZXMsIHZlbmRvcnMgd2lsbCBwcm92aWRlCj4gZXh0cmEgc3BhY2UgcmVzZXJ2
ZWRfYmxvY2tzLiBIb3dldmVyLCBpdCBpcyBub3QgZW5vdWdoLCBzaW5jZSB0aGlzCj4gZXh0cmEg
c3BhY2Ugc2hvdWxkIG5vdCBiZSBzaG93biB0byB1c2Vycy4gU28sIHdpdGggdGhpcyBuZXcgc3lz
ZnMKPiBub2RlLCB3ZSBjYW4gaGlkZSB0aGUgc3BhY2UgYnkgc3Vic3RyYWN0aW5nIHJlc2VydmVk
X2Jsb2NrcyBmcm9tIHRvdGFsCj4gYnl0ZXMuICsgK1doYXQ6CQkvc3lzL2ZzL2YyZnMvPGRpc2s+
L2VuY29kaW5nX2ZsYWdzCj4gK0RhdGU6CQlBcHJpbCAyMDI1ICtDb250YWN0OgkiQ2hhbyBZdSIK
PiA8Y2hhb0BrZXJuZWwub3JnPiArRGVzY3JpcHRpb246CVRoaXMgaXMgYSByZWFkLW9ubHkgZW50
cnkgdG8KPiBzaG93IHRoZSB2YWx1ZSBvZiBzYi5zX2VuY29kaW5nX2ZsYWdzLCB0aGUgKwkJdmFs
dWUgaXMKPiBoZXhhZGVjaW1hbC4gKyArCQk9PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA9
PT09PT09PT09ICsJCUZsYWdfTmFtZSAgICAgICAgICAgICAgICAgICAgICAgIEZsYWdfVmFsdWUg
Kwo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PSAgICAgID09PT09PT09PT0gKwo+IFNCX0VO
Q19TVFJJQ1RfTU9ERV9GTCAgICAgICAgICAgIDB4MDAwMDAwMDEgKwo+IFNCX0VOQ19OT19DT01Q
QVRfRkFMTEJBQ0tfRkwgICAgIDB4MDAwMDAwMDIgKwo+ID09PT09PT09PT09PT09PT09PT09PT09
PT09PSAgICAgID09PT09PT09PT0gZGlmZiAtLWdpdAo+IGEvZnMvZjJmcy9zeXNmcy5jIGIvZnMv
ZjJmcy9zeXNmcy5jIGluZGV4IDNhMzQ4NTYyMjY5MS4uY2Y5OGM1Y2JiOThhCj4gMTAwNjQ0IC0t
LSBhL2ZzL2YyZnMvc3lzZnMuYyArKysgYi9mcy9mMmZzL3N5c2ZzLmMgQEAgLTI3NCw2ICsyNzQs
MTMKPiBAQCBzdGF0aWMgc3NpemVfdCBlbmNvZGluZ19zaG93KHN0cnVjdCBmMmZzX2F0dHIgKmEs
IHJldHVybgo+IHN5c2ZzX2VtaXQoYnVmLCAiKG5vbmUpXG4iKTsgfQo+ICAKPiArc3RhdGljIHNz
aXplX3QgZW5jb2RpbmdfZmxhZ3Nfc2hvdyhzdHJ1Y3QgZjJmc19hdHRyICphLCArCj4gc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLCBjaGFyICpidWYpICt7ICsJcmV0dXJuIHN5c2ZzX2VtaXQoYnVm
LAo+ICIleFxuIiwgKwo+IGxlMTZfdG9fY3B1KEYyRlNfUkFXX1NVUEVSKHNiaSktPnNfZW5jb2Rp
bmdfZmxhZ3MpKTsgK30gKyBzdGF0aWMKPiBzc2l6ZV90IG1vdW50ZWRfdGltZV9zZWNfc2hvdyhz
dHJ1Y3QgZjJmc19hdHRyICphLCBzdHJ1Y3QgZjJmc19zYl9pbmZvCj4gKnNiaSwgY2hhciAqYnVm
KSB7IEBAIC0xMTU4LDYgKzExNjUsNyBAQAo+IEYyRlNfR0VORVJBTF9ST19BVFRSKGZlYXR1cmVz
KTsKPiBGMkZTX0dFTkVSQUxfUk9fQVRUUihjdXJyZW50X3Jlc2VydmVkX2Jsb2Nrcyk7Cj4gRjJG
U19HRU5FUkFMX1JPX0FUVFIodW51c2FibGUpOyBGMkZTX0dFTkVSQUxfUk9fQVRUUihlbmNvZGlu
Zyk7Cj4gK0YyRlNfR0VORVJBTF9ST19BVFRSKGVuY29kaW5nX2ZsYWdzKTsKPiBGMkZTX0dFTkVS
QUxfUk9fQVRUUihtb3VudGVkX3RpbWVfc2VjKTsKPiBGMkZTX0dFTkVSQUxfUk9fQVRUUihtYWlu
X2Jsa2FkZHIpOwo+IEYyRlNfR0VORVJBTF9ST19BVFRSKHBlbmRpbmdfZGlzY2FyZCk7IEBAIC0x
MjcwLDYgKzEyNzgsNyBAQCBzdGF0aWMKPiBzdHJ1Y3QgYXR0cmlidXRlICpmMmZzX2F0dHJzW10g
PSB7IEFUVFJfTElTVChyZXNlcnZlZF9ibG9ja3MpLAo+IEFUVFJfTElTVChjdXJyZW50X3Jlc2Vy
dmVkX2Jsb2NrcyksIEFUVFJfTElTVChlbmNvZGluZyksICsKPiBBVFRSX0xJU1QoZW5jb2Rpbmdf
ZmxhZ3MpLCBBVFRSX0xJU1QobW91bnRlZF90aW1lX3NlYyksICNpZmRlZgo+IENPTkZJR19GMkZT
X1NUQVRfRlMgQVRUUl9MSVNUKGNwX2ZvcmVncm91bmRfY2FsbHMpLCAtLSAyLjQ5LjAKPiAKCi0t
IApMZWUgSm9uZXMgW+adjueQvOaWr10KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
