//
//  XMLWriter.swift
//  Created by Julien Martin on 07/08/2021.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import libxml2


public final class XMLTextWriter {
    fileprivate let cTextWritter: xmlTextWriterPtr
    
    /// Creates and returns an instance of XMLTextWriter.
    /// - parameter path: path of the file for the output
    /// - parameter compression: should be set to true if output should be compressed
    public init(path: String, compression: Bool = false) {
        cTextWritter = xmlNewTextWriterFilename(path, Int32(compression ? 1 : 0))
    }
    
    deinit {
        xmlFreeTextWriter(cTextWritter)
    }
    
    /// Ends the current xml attribute.
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func endAttribute() -> Int {
        Int(xmlTextWriterEndAttribute(cTextWritter))
    }
    
    /// Ends the current xml comment.
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func endComment() -> Int {
        Int(xmlTextWriterEndComment(cTextWritter))
    }
    
    /// Ends an xml CDATA section.
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func endCDATA() -> Int {
        Int(xmlTextWriterEndCDATA(cTextWritter))
    }
    
    /// Ends an xml DTD.
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func endDTD() -> Int {
        Int(xmlTextWriterEndDTD(cTextWritter))
    }
    
    /// Ends an xml DTD attribute list.
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func endDTDAttlist() -> Int {
        Int(xmlTextWriterEndDTDAttlist(cTextWritter))
    }
    
    /// Ends an xml DTD element.
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func endDTDElement() -> Int {
        Int(xmlTextWriterEndDTDElement(cTextWritter))
    }
    
    /// Ends an xml DTD entity.
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func endDTDEntity() -> Int {
        Int(xmlTextWriterEndDTDEntity(cTextWritter))
    }
    
    /// Ends an xml document. All open elements are closed, and the content is flushed to the output.
    /// - returns: the bytes written or -1 in case of error
    @discardableResult public func endDocument() -> Int {
        Int(xmlTextWriterEndDocument(cTextWritter))
    }
    
    /// Ends the current xml element.
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func endElement() -> Int {
        Int(xmlTextWriterEndElement(cTextWritter))
    }
    
    /// Ends the current xml PI.
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func endPI() -> Int {
        Int(xmlTextWriterEndElement(cTextWritter))
    }
    
    /// Flushes the output buffer.
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func flush() -> Int {
        Int(xmlTextWriterFlush(cTextWritter))
    }
    
    /// Ends the current xml element. Writes an end tag even if the element is empty.
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func fullEndElement() -> Int {
        Int(xmlTextWriterFullEndElement(cTextWritter))
    }
    
    /// Sets indentation output.
    /// - returns: -1 on error or 0 otherwise.
    @discardableResult public func setIndent(_ i: Bool) -> Int {
        Int(xmlTextWriterSetIndent(cTextWritter, Int32(i ? 1 : 0)))
    }
    
    /// Sets string indentation.
    /// - parameter s: the indentation string
    /// - returns: -1 on error or 0 otherwise.
    @discardableResult public func setIndentString(_ s: String) -> Int {
        Int(xmlTextWriterSetIndentString(cTextWritter, s))
    }
    
    /// Sets the character used for quoting attributes.
    /// - parameter c: the quote character
    /// - returns: -1 on error or 0 otherwise.
    @discardableResult public func setQuoteChar(_ c: Character) -> Int {
        guard let v = c.asciiValue else { return  -1 }
        return Int(xmlTextWriterSetQuoteChar(cTextWritter, v))
    }
    
    /// Starts an xml attribute.
    /// - parameter name: the attribute name
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func startAttribute(name: String) -> Int {
        Int(xmlTextWriterStartAttribute(cTextWritter, name))
    }
    
    /// Starts an xml attribute with namespace support.
    /// - parameter prefix: the namespace prefix
    /// - parameter name: the attribute local name
    /// - parameter namespaceURI: the namespace URI
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func startAttributeNS(prefix: String?, name: String, namespaceURI: String?) -> Int {
        Int(xmlTextWriterStartAttributeNS(cTextWritter, prefix, name, namespaceURI))
    }
    
    /// Starts an xml CDATA section.
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func startCDATA() -> Int {
        Int(xmlTextWriterStartCDATA(cTextWritter))
    }
    
    /// Starts an xml comment.
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func startComment() -> Int {
        Int(xmlTextWriterStartComment(cTextWritter))
    }
    
    /// Starts an xml DTD.
    /// - parameter name: the name of the DTD
    /// - parameter pubId: the public identifier, which is an alternative to the system identifier
    /// - parameter sysId: the system identifier, which is the URI of the DTD
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func startDTD(name: String, pubId: String, sysId: String) -> Int {
        Int(xmlTextWriterStartDTD(cTextWritter, name, pubId, sysId))
    }
    
    /// Starts an xml DTD ATTLIST.
    /// - parameter name: the name of the DTD ATTLIST
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func startDTDAttlist(name: String) -> Int {
        Int(xmlTextWriterStartDTDAttlist(cTextWritter, name))
    }
    
    /// Starts an xml DTD element.
    /// - parameter name: the name of the DTD element
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func startDTDElement(name: String) -> Int {
        Int(xmlTextWriterStartDTDElement(cTextWritter, name))
    }
    
    /// Starts an xml DTD entity.
    /// - parameter name: the name of the DTD Entity
    /// - parameter isParameter: true if this is a parameter entity, false if not
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func startDTDEntity(name: String, isParameter: Bool) -> Int {
        Int(xmlTextWriterStartDTDEntity(cTextWritter, Int32(isParameter ? 1 : 0), name))
    }
    
    /// Starts a new xml document
    /// - parameter version: the xml version ("1.0")
    /// - parameter encoding: the encoding, or nil for default
    /// - parameter standalone: "yes" or "no", or nil for default
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func startDocument(version: String = "1.0", encoding: String.Encoding? = nil, standalone: Bool? = nil) -> Int {
        var enc: String?
        if let encoding = encoding {
            let e = CFStringConvertNSStringEncodingToEncoding(encoding.rawValue)
            if e != kCFStringEncodingInvalidId {
                enc = CFStringConvertEncodingToIANACharSetName(e) as String?
            }
        }
        var s: String?
        if let standalone = standalone {
            s = standalone ? "yes" : "no"
        }
        return Int(xmlTextWriterStartDocument(cTextWritter, version, enc, s))
    }
    
    /// Starts an xml element.
    /// - parameter name: the element name
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func startElement(name: String) -> Int {
        Int(xmlTextWriterStartElement(cTextWritter, name))
    }
    
    /// Starts an xml element with namespace support.
    /// - parameter prefix: optional namespace prefix
    /// - parameter name: the element local name
    /// - parameter namespaceURI: optional namespace URI
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func startElementNS(prefix: String?, name: String, namespaceURI: String?) -> Int {
        Int(xmlTextWriterStartElementNS(cTextWritter, prefix, name, namespaceURI))
    }
    
    /// Starts an xml PI.
    /// - parameter target: PI target
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func startPI(target: String) -> Int {
        Int(xmlTextWriterStartPI(cTextWritter, target))
    }
    
    /// Writes an xml attribute.
    /// - parameter name: the attribute name
    /// - parameter content: the attribute content
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func writeAttribute(name: String, content: String) -> Int {
        Int(xmlTextWriterWriteAttribute(cTextWritter, name, content))
    }
    
    /// Writes an xml attribute with namespace support.
    /// - parameter prefix: the namespace prefix
    /// - parameter name: the attribute local name
    /// - parameter namespaceURI: the namespace URI
    /// - parameter content: the attribute content
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func writeAttributeNS(prefix: String?, name: String, namespaceURI: String?, content: String) -> Int {
        Int(xmlTextWriterWriteAttributeNS(cTextWritter, prefix, name, namespaceURI, content))
    }
    
    /// Writes an xml comment.
    /// - parameter comment: the comment string
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func writeComment(_ comment: String) -> Int {
        Int(xmlTextWriterWriteComment(cTextWritter, comment))
    }
    
    /// Writes an xml element.
    /// - parameter name: the element name
    /// - parameter content: the element content
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func writeElement(name: String, content: String) -> Int {
        Int(xmlTextWriterWriteElement(cTextWritter, name, content))
    }
    
    /// Writes an xml text.
    /// - parameter s: the text string
    /// - returns: the bytes written (may be 0 because of buffering) or -1 in case of error
    @discardableResult public func writeString(_ s: String) -> Int {
        Int(xmlTextWriterWriteString(cTextWritter, s))
    }
}
